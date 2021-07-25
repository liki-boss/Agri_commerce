import 'package:baskets_repository/src/entities/basket_item_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BasketEntity extends Equatable {
  static const String ITEMS = 'items';

  final String id;
  // Map<itemID, itemDetails>
  final Map<String, BasketItemEntity> items;

  const BasketEntity(this.id, this.items);

  @override
  List<Object?> get props => [id, items];

  @override
  String toString() => 'BasketEntity: { id: $id, items: $items }';

  static BasketEntity fromSnapshot(DocumentSnapshot snapshot) => BasketEntity(
      snapshot.id,
      (snapshot.get(ITEMS) as Map).map((itemId, itemMap) =>
          MapEntry(itemId, BasketItemEntity.fromItemMap(itemMap))));

  Map<String, Object> toDocument() => {
        ITEMS: items.map((String itemId, BasketItemEntity item) =>
            MapEntry(itemId, item.toItemMap()))
      };
}
