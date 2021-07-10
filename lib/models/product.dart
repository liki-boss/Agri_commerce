import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const String NAME = 'name';
  static const String DESCRIPTION = 'description';
  static const String IMAGES = 'images';
  static const String PRICE = 'price';
  static const String CATEGORY = 'category';
  static const String SUB_CATEGORY = 'sub-category';
  static const String SELLER_NAME = 'seller-name';
  static const String SELLER_ID = 'seller-id';
  static const String AVAILABLE = 'available';

  String _id = '';
  String _name = '';
  String _description = '';
  List _images = [];
  int _price = 0;
  String _category = '';
  String _subCategory = '';
  String _sellerName = '';
  String _sellerId = '';
  bool _available = true;

  String get id => _id;

  String get name => _name;

  String get description => _description;

  List get images => _images;

  int get price => _price;

  String get category => _category;

  String get subCategory => _subCategory;

  String get sellerId => _sellerId;

  String get sellerName => _sellerName;

  bool get available => _available;

  Product() {
    _images = [
      'https://firebasestorage.googleapis.com/v0/b/agri-com.appspot.com/o/add.png?alt=media&token=b72ff0c8-f3c5-4113-8d5c-0e2237972471'
    ];
  }

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.id;
    _name = snapshot.get(NAME);
    _description = snapshot.get(DESCRIPTION);
    _images = snapshot.get(IMAGES);
    _price = snapshot.get(PRICE);
    _category = snapshot.get(CATEGORY);
    _subCategory = snapshot.get(SUB_CATEGORY);
    _sellerId = snapshot.get(SELLER_ID);
    _sellerName = snapshot.get(SELLER_NAME);
    _available = snapshot.get(AVAILABLE);
  }
}
