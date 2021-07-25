part of 'baskets_bloc.dart';

abstract class BasketsState extends Equatable {
  const BasketsState();

  @override
  List<Object?> get props => [];
}

class BasketsLoadInProgress extends BasketsState {}

class BasketsLoadSuccess extends BasketsState {
  final LinkedHashMap<String, Basket> baskets = LinkedHashMap();

  BasketsLoadSuccess(List<Basket> baskets) {
    baskets.forEach((basket) {
      this.baskets[basket.id] = basket;
    });
  }

  @override
  List<Object?> get props => [baskets];

  @override
  String toString() => 'BasketsLoadSuccess: { baskets: $baskets }';
}

class BasketsLoadFailure extends BasketsState {}


