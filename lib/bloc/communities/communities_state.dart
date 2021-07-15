part of 'communities_bloc.dart';

abstract class CommunitiesState extends Equatable {
  const CommunitiesState();

  @override
  List<Object> get props => [];
}

class CommunitiesLoadInProgress extends CommunitiesState {}

class CommunitiesLoadSuccess extends CommunitiesState {
  final LinkedHashMap<String, Community> communities = LinkedHashMap();

  CommunitiesLoadSuccess(List<Community> communities) {
    communities.forEach((community) {
      this.communities[community.id] = community;
    });
  }

  @override
  List<Object> get props => [communities];

  @override
  String toString() => 'CommunitiesLoadSuccess: { communities: $communities }';
}

class CommunitiesLoadFailure extends CommunitiesState {}
