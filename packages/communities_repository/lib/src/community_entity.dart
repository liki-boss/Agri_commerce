import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommunityEntity extends Equatable {
  static const String DISPLAY_NAME = 'display-name';
  static const String AVATAR_URL = 'avatar-url';
  static const String DISTRICT = 'district';

  final String id;
  final String displayName;
  final String avatarUrl;
  final String district;

  const CommunityEntity(
      this.id, this.displayName, this.avatarUrl, this.district);

  @override
  String toString() => 'CommunityEntity: { '
      'id: $id, '
      'displayName: $displayName, '
      'avatarUrl: $avatarUrl, '
      'district: $district }';

  @override
  List<Object?> get props => [id, displayName, avatarUrl, district];

  static CommunityEntity fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityEntity(
        snapshot.id,
        snapshot.get(DISPLAY_NAME),
        snapshot.get(AVATAR_URL),
        snapshot.get(DISTRICT),
      );

  Map<String, Object> toDocument() =>
      {DISPLAY_NAME: displayName, AVATAR_URL: avatarUrl, DISTRICT: district};
}
