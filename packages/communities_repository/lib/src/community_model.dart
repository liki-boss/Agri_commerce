import 'package:communities_repository/src/community_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Community extends Equatable {
  final String id;
  final String displayName;
  final String avatarUrl;
  final String district;

  const Community(
      {required this.id,
      required this.displayName,
      this.avatarUrl = "",
      required this.district});

  @override
  List<Object?> get props => [id, displayName, avatarUrl, district];

  @override
  String toString() => 'Community: { '
      'id: $id, '
      'displayName: $displayName, '
      'avatarUrl: $avatarUrl '
      'district: $district }';

  Community copyWith(
          {String? id,
          String? displayName,
          String? avatarUrl,
          String? district}) =>
      Community(
        id: id ?? this.id,
        displayName: displayName ?? this.displayName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        district: district ?? this.district,
      );

  CommunityEntity toEntity() =>
      CommunityEntity(id, displayName, avatarUrl, district);

  static Community fromEntity(CommunityEntity entity) => Community(
        id: entity.id,
        displayName: entity.displayName,
        avatarUrl: entity.avatarUrl,
        district: entity.district,
      );
}
