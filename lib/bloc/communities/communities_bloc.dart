import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:equatable/equatable.dart';

part 'communities_event.dart';

part 'communities_state.dart';

class CommunitiesBloc extends Bloc<CommunitiesEvent, CommunitiesState> {
  FirebaseCommunitiesRepository _firebaseCommunitiesRepository;
  StreamSubscription<List<Community>>? _streamSubscription;

  CommunitiesBloc(
      {required FirebaseCommunitiesRepository firebaseCommunitiesRepository})
      : _firebaseCommunitiesRepository = firebaseCommunitiesRepository,
        super(CommunitiesLoadInProgress());

  @override
  Stream<CommunitiesState> mapEventToState(
    CommunitiesEvent event,
  ) async* {
    if (event is CommunitiesLoaded)
      yield* _mapCommunitiesLoadedToState(event);
    else if (event is CommunitiesUpdated)
      yield* _mapCommunitiesUpdatedToState(event);
    else if (event is CommunityAdded)
      yield* _mapCommunityAddedToState(event);
    else if (event is CommunityUpdated)
      yield* _mapCommunityUpdatedToState(event);
  }

  Stream<CommunitiesState> _mapCommunitiesLoadedToState(
      CommunitiesLoaded event) async* {
    _streamSubscription?.cancel();
    _streamSubscription =
        _firebaseCommunitiesRepository.communities().listen((communities) {
      add(CommunitiesUpdated(communities));
    });
  }

  Stream<CommunitiesState> _mapCommunitiesUpdatedToState(
      CommunitiesUpdated event) async* {
    yield CommunitiesLoadSuccess(event.communities);
  }

  Stream<CommunitiesState> _mapCommunityAddedToState(
      CommunityAdded event) async* {
    _firebaseCommunitiesRepository.addCommunity(event.community);
  }

  Stream<CommunitiesState> _mapCommunityUpdatedToState(
      CommunityUpdated event) async* {
    _firebaseCommunitiesRepository.updateCommunity(event.community);
  }
}
