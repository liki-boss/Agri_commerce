part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class ProductsLoaded extends ProductsEvent {}

class ProductsUpdated extends ProductsEvent {
  final List<Product> products;

  const ProductsUpdated(this.products);

  @override
  List<Object?> get props => [products];

  @override
  String toString() => 'ProductsUpdated: { products: $products }';
}
