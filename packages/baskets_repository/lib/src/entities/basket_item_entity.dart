import 'package:baskets_repository/src/entities/share_details_entity.dart';
import 'package:equatable/equatable.dart';

class BasketItemEntity extends Equatable {
  static const String SHARE_DETAILS = 'share-details';

  // Map<userId, shareDetails>
  final Map<String, ShareDetailsEntity> shareDetails;

  BasketItemEntity(this.shareDetails);

  @override
  List<Object?> get props => [shareDetails];

  @override
  String toString() => 'BasketItemEntity: { shareDetails: $shareDetails }';

  static BasketItemEntity fromItemMap(Map itemMap) =>
      BasketItemEntity((itemMap[SHARE_DETAILS] as Map).map((userId, shareMap) =>
          MapEntry(userId, ShareDetailsEntity.fromShareMap(shareMap))));

  Map<String, Object> toItemMap() => {
        SHARE_DETAILS: shareDetails.map(
            (userId, shareDetail) => MapEntry(userId, shareDetail.toShareMap()))
      };
}
