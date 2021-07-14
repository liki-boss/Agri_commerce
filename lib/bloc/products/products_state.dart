part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  final LinkedHashMap<String, List<Product>> products = LinkedHashMap();

  ProductsLoadSuccess([List<Product> products = const []]) {
    products.forEach((product) {
      if (this.products.containsKey(product.subCategory))
        this.products[product.subCategory]!.add(product);
      else
        this.products[product.subCategory] = [product];
    });
  }

  @override
  List<Object?> get props => [products];

  @override
  String toString() => 'ProductsLoadSuccess: { products: $products}';
}

class ProductsLoadFailure extends ProductsState {}
