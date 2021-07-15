import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_repository/users_repository.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  FirebaseUsersRepository _firebaseUsersRepository;
  StreamSubscription<List<ConnekTUser>>? _streamSubscription;

  UsersBloc({required FirebaseUsersRepository firebaseUsersRepository})
      : _firebaseUsersRepository = firebaseUsersRepository,
        super(UsersLoadInProgress());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is UsersLoaded)
      yield* _mapUsersLoadedToState(event);
    else if (event is UsersUpdated)
      yield* _mapUsersUpdatedToState(event);
    else if (event is UserAdded)
      yield* _mapUserAddedToState(event);
    else if (event is UserUpdated)
      yield* _mapUserUpdatedToState(event);
    else if (event is UserDeleted) yield* _mapUserDeletedToState(event);
  }

  Stream<UsersState> _mapUsersLoadedToState(UsersLoaded event) async* {
    _streamSubscription?.cancel();
    _streamSubscription = _firebaseUsersRepository.users().listen((users) {
      add(UsersUpdated(users));
    });
  }

  Stream<UsersState> _mapUsersUpdatedToState(UsersUpdated event) async* {
    yield UsersLoadSuccess(event.users);
  }

  Stream<UsersState> _mapUserAddedToState(UserAdded event) async* {
    _firebaseUsersRepository.addUser(event.user);
  }

  Stream<UsersState> _mapUserUpdatedToState(UserUpdated event) async* {
    _firebaseUsersRepository.updateUser(event.user);
  }

  Stream<UsersState> _mapUserDeletedToState(UserDeleted event) async* {
    _firebaseUsersRepository.deleteUser(event.user);
  }
}
