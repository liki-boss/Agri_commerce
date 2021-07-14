import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:products_repository/src/product_entity.dart';

import 'fruits.dart';
import 'vegetables.dart';

@immutable
class Product extends Equatable {
  final String id;
  final String name;
  final String tag;
  final String description;
  final List pictures;
  final int rate;
  final String category;
  final String subCategory;
  final String farmerId;
  final String communityId;
  final bool available;
  late final bool isWeighed;
  late final List<double> weights;

  Product({
    this.id = '',
    required this.name,
    required this.tag,
    required this.description,
    required this.pictures,
    required this.rate,
    required this.category,
    required this.subCategory,
    required this.farmerId,
    required this.communityId,
    required this.available,
  }) {
    if (this.category == 'Fruits') {
      this.isWeighed = Fruits[this.subCategory]!['weighed'];
      this.weights = Fruits[this.subCategory]!['weights'];
    } else {
      this.isWeighed = Vegetables[this.subCategory]!['weighed'];
      this.weights = Vegetables[this.subCategory]!['weights'];
    }
  }

  Product copyWith(
      {String? id,
      String? name,
      String? tag,
      String? description,
      List<String>? pictures,
      int? rate,
      String? category,
      String? subCategory,
      String? farmerId,
      String? communityId,
      bool? available}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      tag: tag ?? this.tag,
      description: description ?? this.description,
      pictures: pictures ?? this.pictures,
      rate: rate ?? this.rate,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      farmerId: farmerId ?? this.farmerId,
      communityId: communityId ?? this.communityId,
      available: available ?? this.available,
    );
  }

  @override
  List<Object?> get props =>
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

  @override
  String toString() => 'Product: {'
      'id: $id, '
      'name: $name, '
      'tag: $tag, '
      'description: $description, '
      'pictures: $pictures, '
      'rate: $rate, '
      'category: $category, '
      'subCategory: $subCategory, '
      'farmerId: $farmerId, '
      'communityId: $communityId, '
      'available: $available'
      '}';

  ProductEntity toEntity() => ProductEntity(id, name, tag, description,
      pictures, rate, category, subCategory, farmerId, communityId, available);

  static Product fromEntity(ProductEntity entity) => Product(
    id: entity.id,
        name: entity.name,
        tag: entity.tag,
        description: entity.description,
        pictures: entity.pictures,
        rate: entity.rate,
        category: entity.category,
        subCategory: entity.subCategory,
        farmerId: entity.farmerId,
        communityId: entity.communityId,
        available: entity.available,
      );
}
