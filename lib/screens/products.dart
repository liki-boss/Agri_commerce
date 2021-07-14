import 'package:agri_commerce/widgets/custom_action_bar.dart';
import 'package:agri_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';

class Products extends StatelessWidget {
  final List<Product> products;

  const Products({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.only(top: 108, left: 16, right: 16),
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ProductCard(product: products[index]),
                  )),
          CustomActionBar(
            title: products[0].subCategory,
            hasBackArrow: true,
          )
        ],
      ),
    );
  }
}
