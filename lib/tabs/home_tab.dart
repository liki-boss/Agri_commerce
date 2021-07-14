import 'package:agri_commerce/bloc/products/products_bloc.dart';
import 'package:agri_commerce/screens/products.dart';
import 'package:agri_commerce/widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  static final String routeName = '/select-subcategory';

  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.select((ProductsBloc bloc) =>
        bloc.state is ProductsLoadSuccess
            ? (bloc.state as ProductsLoadSuccess).products
            : {});
    var subCategories = products.keys.toList();

    return Stack(
      children: [
        GridView.builder(
          itemCount: subCategories.length,
          padding: EdgeInsets.only(top: 108, left: 16, right: 16),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Products(
                    products: products[subCategories[index]],
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Fruits.containsKey(subCategories[index])
                          ? 'assets/images/tab_fruits.png'
                          : "assets/images/tab_vegetables.png",
                      height: 72,
                      width: 72,
                    ),
                    Text(subCategories[index]),
                  ],
                ),
              ),
            ),
          ),
        ),
        CustomActionBar(
          title: 'Select sub category',
          hasBackArrow: false,
        )
      ],
    );
  }
}
