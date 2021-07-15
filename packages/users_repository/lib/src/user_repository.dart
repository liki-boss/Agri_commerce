import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:users_repository/src/user_entity.dart';
import 'package:users_repository/src/user_model.dart';

class FirebaseUsersRepository {
  final usersCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(ConnekTUser user) {
    return usersCollection.add(user.toEntity().toDocument());
  }

  Future<void> deleteUser(ConnekTUser user) {
    return usersCollection.doc(user.id).delete();
  }

  Stream<List<ConnekTUser>> users() {
    return usersCollection.snapshots().map((snapshot) => snapshot.docs
        .map((userDoc) =>
            ConnekTUser.fromEntity(UserEntity.fromSnapshot(userDoc)))
        .toList());
  }

  Future<void> updateUser(ConnekTUser user) {
    return usersCollection.doc(user.id).update(user.toEntity().toDocument());
  }
}
