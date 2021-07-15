import 'package:agri_commerce/bloc/communities/communities_bloc.dart';
import 'package:agri_commerce/bloc/users/users_bloc.dart';
import 'package:agri_commerce/widgets/product_size.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Community? community = context.select((CommunitiesBloc bloc) =>
        bloc.state is CommunitiesLoadSuccess
            ? (bloc.state as CommunitiesLoadSuccess)
                .communities[product.communityId]
            : null);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(
                  product.pictures[0],
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.tag.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '#${product.tag}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    Text(
                      context.select((UsersBloc bloc) =>
                          bloc.state is UsersLoadSuccess
                              ? (bloc.state as UsersLoadSuccess)
                                  .users[product.farmerId]!
                                  .displayName
                              : ''),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      community != null
                          ? '${community.displayName}, ${community.district}'
                          : '',
                      style: TextStyle(color: Color(0xFF666666)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                          '@ Rs ${product.rate} per ${product.isWeighed ? 'kg' : 'unit'}'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductSize(
                          productSizes: product.weights,
                          onSelected: (size) {},
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('Add'))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
