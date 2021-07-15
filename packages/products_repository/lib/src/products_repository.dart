import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_repository/src/product_entity.dart';
import 'package:products_repository/src/product_model.dart';

abstract class ProductsRepository {
  Future<void> addProduct(Product product);

  Future<void> deleteProduct(Product product);

  Stream<List<Product>> products();

  Future<void> updateProduct(Product product);
}

class FirebaseProductsRepository implements ProductsRepository {
  final productsCollection = FirebaseFirestore.instance.collection('Products');

  @override
  Future<void> addProduct(Product product) {
    return productsCollection.add(product.toEntity().toDocument());
  }

  @override
  Future<void> deleteProduct(Product product) {
    return productsCollection.doc(product.id).delete();
  }

  @override
  Stream<List<Product>> products() {
    return productsCollection.snapshots().map((snapshot) => snapshot.docs
        .map((productDoc) =>
            Product.fromEntity(ProductEntity.fromSnapshot(productDoc)))
        .toList());
  }

  @override
  Future<void> updateProduct(Product product) {
    return productsCollection
        .doc(product.id)
        .update(product.toEntity().toDocument());
  }
}
