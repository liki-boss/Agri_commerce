import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communities_repository/src/community_entity.dart';
import 'package:communities_repository/src/community_model.dart';

class FirebaseCommunitiesRepository {
  final communitiesCollection =
      FirebaseFirestore.instance.collection('Communities');

  Future<void> addCommunity(Community community) {
    return communitiesCollection.add(community.toEntity().toDocument());
  }

  Stream<List<Community>> communities() {
    return communitiesCollection.snapshots().map((snapshot) => snapshot.docs
        .map((communityDoc) =>
            Community.fromEntity(CommunityEntity.fromSnapshot(communityDoc)))
        .toList());
  }

  Future<void> updateCommunity(Community community) {
    return communitiesCollection
        .doc(community.id)
        .update(community.toEntity().toDocument());
  }
}
