import 'package:baskets_repository/src/entities/basket_item_entity.dart';
import 'package:baskets_repository/src/models/share_details_model.dart';
import 'package:equatable/equatable.dart';

class BasketItem extends Equatable {
  final Map<String, ShareDetails> shareDetails;

  const BasketItem({required this.shareDetails});

  @override
  List<Object?> get props => [shareDetails];

  @override
  String toString() => 'BasketItem: { shareDetails: $shareDetails }';

  BasketItem copyWith({Map<String, ShareDetails>? shareDetails}) =>
      BasketItem(shareDetails: shareDetails ?? this.shareDetails);

  static BasketItem fromEntity(BasketItemEntity entity) => BasketItem(
      shareDetails: entity.shareDetails.map((userId, shareDetailEntity) =>
          MapEntry(userId, ShareDetails.fromEntity(shareDetailEntity))));

  BasketItemEntity toEntity() => BasketItemEntity(shareDetails
      .map((userId, shareDetail) => MapEntry(userId, shareDetail.toEntity())));
}
