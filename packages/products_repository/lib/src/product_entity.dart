import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TAG = 'tag';
  static const String DESCRIPTION = 'description';
  static const String PICTURES = 'pictures';
  static const String RATE = 'rate';
  static const String CATEGORY = 'category';
  static const String SUB_CATEGORY = 'sub-category';
  static const String FARMER_ID = 'farmer-id';
  static const String COMMUNITY_ID = 'community-id';
  static const String AVAILABLE = 'available';

  final String id;
  final String name;
  final String tag;
  final String description;
  final List<String> pictures;
  final int rate;
  final String category;
  final String subCategory;
  final String farmerId;
  final String communityId;
  final bool available;

  const ProductEntity(
      this.id,
      this.name,
      this.tag,
      this.description,
      this.pictures,
      this.rate,
      this.category,
      this.subCategory,
      this.farmerId,
      this.communityId,
      this.available);

  Map<String, Object> toJson() =>
      {
        ID: id,
        NAME: name,
        TAG: tag,
        DESCRIPTION: description,
        PICTURES: pictures,
        RATE: rate,
        CATEGORY: category,
        SUB_CATEGORY: subCategory,
        FARMER_ID: farmerId,
        COMMUNITY_ID: communityId,
        AVAILABLE: available,
      };

  @override
  List<Object> get props =>
      [
        id,
        name,
        tag,
        description,
        pictures,
        rate,
        category,
        subCategory,
        farmerId,
        communityId,
        available
      ];

  static ProductEntity fromJson(Map<String, Object> json) {
    return ProductEntity(
      json[ID] as String,
      json[NAME] as String,
      json[TAG] as String,
      json[DESCRIPTION] as String,
      json[PICTURES] as List<String>,
      json[RATE] as int,
      json[CATEGORY] as String,
      json[SUB_CATEGORY] as String,
      json[FARMER_ID] as String,
      json[COMMUNITY_ID] as String,
      json[AVAILABLE] as bool,
    );
  }

  static ProductEntity fromSnapshot(DocumentSnapshot snapshot) {
    return ProductEntity(
      snapshot.id,
      snapshot.get(NAME),
      snapshot.get(TAG),
      snapshot.get(DESCRIPTION),
      (snapshot.get(PICTURES) as List).cast<String>(),
      snapshot.get(RATE),
      snapshot.get(CATEGORY),
      snapshot.get(SUB_CATEGORY),
      snapshot.get(FARMER_ID),
      snapshot.get(COMMUNITY_ID),
      snapshot.get(AVAILABLE),
    );
  }

  Map<String, Object> toDocument() {
    return {
      NAME: name,
      TAG: tag,
      DESCRIPTION: description,
      PICTURES: pictures,
      RATE: rate,
      CATEGORY: category,
      SUB_CATEGORY: subCategory,
      FARMER_ID: farmerId,
      COMMUNITY_ID: communityId,
      AVAILABLE: available,
    };
  }
}
