part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class UsersLoaded extends UsersEvent {}

class UsersUpdated extends UsersEvent {
  final List<ConnekTUser> users;

  const UsersUpdated(this.users);

  @override
  List<Object?> get props => [users];

  @override
  String toString() => 'UsersUpdated: { users: $users }';
}

class UserAdded extends UsersEvent {
  final ConnekTUser user;

  const UserAdded(this.user);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'UserAdded: { user: $user }';
}

class UserUpdated extends UsersEvent {
  final ConnekTUser user;

  const UserUpdated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserUpdated: $user';
}

class UserDeleted extends UsersEvent {
  final ConnekTUser user;

  const UserDeleted(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserDeleted: { user: $user }';
}
