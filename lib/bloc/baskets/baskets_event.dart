part of 'baskets_bloc.dart';

abstract class BasketsEvent extends Equatable {
  const BasketsEvent();

  @override
  List<Object?> get props => [];
}

class BasketsLoaded extends BasketsEvent {}

class BasketsUpdated extends BasketsEvent {
  final List<Basket> baskets;

  const BasketsUpdated(this.baskets);

  @override
  List<Object?> get props => [baskets];

  @override
  String toString() => 'BasketsUpdated: { baskets: $baskets }';
}

class BasketAdded extends BasketsEvent {
  final Basket basket;

  const BasketAdded(this.basket);

  @override
  List<Object?> get props => [basket];

  @override
  String toString() => 'BasketAdded: { basket: $basket }';
}

class BasketUpdated extends BasketsEvent {
  final Basket basket;

  const BasketUpdated(this.basket);

  @override
  List<Object?> get props => [basket];

  @override
  String toString() => 'BasketAdded: { basket: $basket }';
}

class BasketDeleted extends BasketsEvent {
  final Basket basket;

  const BasketDeleted(this.basket);

  @override
  List<Object?> get props => [basket];

  @override
  String toString() => 'BasketDeleted: { basket: $basket }';
}
