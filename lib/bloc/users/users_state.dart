part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersLoadInProgress extends UsersState {}

class UsersLoadSuccess extends UsersState {
  final LinkedHashMap<String, ConnekTUser> users = LinkedHashMap();

  UsersLoadSuccess(List<ConnekTUser> users) {
    users.forEach((user) {
      this.users[user.id] = user;
    });
  }

  @override
  List<Object> get props => [users];

  @override
  String toString() => 'UsersLoadSuccess: { users: $users }';
}

class UsersLoadFailure extends UsersState {}
