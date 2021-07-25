import 'package:baskets_repository/baskets_repository.dart';
import 'package:baskets_repository/src/entities/basket_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Basket extends Equatable {
  final String id;
  final Map<String, BasketItem> items;

  const Basket({
    required this.id,
    required this.items,
  });

  @override
  List<Object?> get props => [id, items];

  @override
  String toString() => 'Basket: { '
      'id: $id, '
      'items: $items }';

  Basket copyWith({String? id, Map<String, BasketItem>? items}) =>
      Basket(id: id ?? this.id, items: items ?? this.items);

  BasketEntity toEntity() => BasketEntity(
      id, items.map((itemId, item) => MapEntry(itemId, item.toEntity())));

  static Basket fromEntity(BasketEntity entity) {
    return Basket(
        id: entity.id,
        items: entity.items.map((itemId, itemEntity) =>
            MapEntry(itemId, BasketItem.fromEntity(itemEntity))));
  }
}
