import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  static const String DISPLAY_NAME = 'display-name';
  static const String AVATAR_URL = 'avatar-url';

  final String id;
  final String displayName;
  final String avatarUrl;

  const UserEntity(this.id, this.displayName, this.avatarUrl);

  @override
  List<Object?> get props => [id, displayName, avatarUrl];

  @override
  String toString() =>
      'UserEntity: { id: $id, displayName: $displayName, avatarUrl: $avatarUrl }';

  static UserEntity fromSnapshot(DocumentSnapshot snapshot) => UserEntity(
      snapshot.id, snapshot.get(DISPLAY_NAME), snapshot.get(AVATAR_URL));

  Map<String, Object> toDocument() =>
      {DISPLAY_NAME: displayName, AVATAR_URL: avatarUrl};
}
