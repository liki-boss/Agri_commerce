part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  final LinkedHashMap<String, List<Product>> productsByCategory =
      LinkedHashMap();
  final LinkedHashMap<String, Product> products = LinkedHashMap();

  ProductsLoadSuccess([List<Product> products = const []]) {
    products.forEach((product) {
      this.products[product.id] = product;
      if (this.productsByCategory.containsKey(product.subCategory))
        this.productsByCategory[product.subCategory]!.add(product);
      else
        this.productsByCategory[product.subCategory] = [product];
    });
  }

  @override
  List<Object?> get props => [products];

  @override
  String toString() => 'ProductsLoadSuccess: { products: $products}';
}

class ProductsLoadFailure extends ProductsState {}
