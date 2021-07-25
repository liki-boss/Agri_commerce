import 'package:baskets_repository/src/entities/basket_entity.dart';
import 'package:baskets_repository/src/models/basket_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBasketsRepository {
  final basketsCollection = FirebaseFirestore.instance.collection('Baskets');

  Future<void> addBasket(Basket basket) {
    return basketsCollection.doc(basket.id).set(basket.toEntity().toDocument());
  }

  Stream<List<Basket>> baskets() {
    return basketsCollection.snapshots().map((snapshot) => snapshot.docs
        .map((basketDoc) =>
            Basket.fromEntity(BasketEntity.fromSnapshot(basketDoc)))
        .toList());
  }

  Future<void> updateBasket(Basket basket) {
    return basketsCollection
        .doc(basket.id)
        .update(basket.toEntity().toDocument());
  }

  Future<void> deleteBasket(Basket basket) {
    return basketsCollection.doc(basket.id).delete();
  }
}
