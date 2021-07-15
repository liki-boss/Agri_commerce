import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:users_repository/src/user_entity.dart';

@immutable
class ConnekTUser extends Equatable {
  final String id;
  final String displayName;
  final String avatarUrl;

  const ConnekTUser(
      {required this.id, required this.displayName, this.avatarUrl = ""});

  @override
  List<Object?> get props => [id, displayName, avatarUrl];

  @override
  String toString() =>
      'User: { id: $id, displayName: $displayName, avatarUrl: $avatarUrl }';

  ConnekTUser copyWith({String? id, String? displayName, String? avatarUrl}) =>
      ConnekTUser(
          id: id ?? this.id,
          displayName: displayName ?? this.displayName,
          avatarUrl: avatarUrl ?? this.avatarUrl);

  UserEntity toEntity() => UserEntity(id, displayName, avatarUrl);

  static ConnekTUser fromEntity(UserEntity entity) => ConnekTUser(
      id: entity.id,
      displayName: entity.displayName,
      avatarUrl: entity.avatarUrl);
}
