part of 'communities_bloc.dart';

abstract class CommunitiesEvent extends Equatable {
  const CommunitiesEvent();

  @override
  List<Object?> get props => [];
}

class CommunitiesLoaded extends CommunitiesEvent {}

class CommunitiesUpdated extends CommunitiesEvent {
  final List<Community> communities;

  const CommunitiesUpdated(this.communities);

  @override
  List<Object?> get props => [communities];

  @override
  String toString() => 'CommunitiesUpdated: { communities: $communities }';
}

class CommunityAdded extends CommunitiesEvent {
  final Community community;

  const CommunityAdded(this.community);

  @override
  List<Object?> get props => [community];

  @override
  String toString() => 'CommunityAdded: { community: $community }';
}

class CommunityUpdated extends CommunitiesEvent {
  final Community community;

  const CommunityUpdated(this.community);

  @override
  List<Object> get props => [community];

  @override
  String toString() => 'CommunityUpdated: $community';
}
