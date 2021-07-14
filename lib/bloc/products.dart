import 'package:products_repository/products_repository.dart';

List<Product> products = [
  Product(
    name: "potato",
    tag: "potato",
    description: "lorem ipsum",
    pictures: [
      'https://firebasestorage.googleapis.com/v0/b/agri-commerce-3d2d8.appspot.com/o/images%2Ff1e5be20-2b22-11eb-90ca-995b7bee4355?alt=media&token=a4678e2f-4b92-4b97-9b1d-0a951f96d1c1',
      'https://firebasestorage.googleapis.com/v0/b/agri-commerce-3d2d8.appspot.com/o/images%2Ff3f193b0-2b22-11eb-90ca-995b7bee4355?alt=media&token=2d6fb164-debb-419a-a3ba-0fb085ec5c53'
    ],
    rate: 50,
    category: 'Vegetables',
    subCategory: 'Potato',
    farmerId: 'farmer1',
    communityId: 'community1',
    available: true,
  )
];
