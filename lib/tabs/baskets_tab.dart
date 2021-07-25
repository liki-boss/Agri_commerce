import 'package:agri_commerce/bloc/baskets/baskets_bloc.dart';
import 'package:agri_commerce/bloc/products/products_bloc.dart';
import 'package:agri_commerce/widgets/custom_action_bar.dart';
import 'package:baskets_repository/baskets_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agri_commerce/bloc/communities/communities_bloc.dart';
import 'package:communities_repository/communities_repository.dart';

class BasketsTab extends StatelessWidget {
  const BasketsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Iterable<Basket> baskets = context.select((BasketsBloc bloc) =>
        bloc.state is BasketsLoadSuccess
            ? (bloc.state as BasketsLoadSuccess).baskets.values
            : []);

    return Stack(children: [
      ListView.builder(
          itemCount: baskets.length,
          padding: EdgeInsets.only(top: 108, left: 16, right: 16),
          itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BasketCard(basket: baskets.elementAt(index)),
              )),
      CustomActionBar(
        title: 'Baskets',
        hasBackArrow: false,
      )
    ]);
  }
}

class BasketCard extends StatelessWidget {
  final Basket basket;

  const BasketCard({Key? key, required this.basket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fromCommunityId = basket.id.split('-')[1];
    Community? fromCommunity = context.select((CommunitiesBloc bloc) => bloc
            .state is CommunitiesLoadSuccess
        ? (bloc.state as CommunitiesLoadSuccess).communities[fromCommunityId]
        : null);
    var products = context.select((ProductsBloc bloc) =>
        bloc.state is ProductsLoadSuccess
            ? (bloc.state as ProductsLoadSuccess).products
            : {});
    var userAdditions = [];
    basket.items.forEach((itemId, item) {
      if (item.shareDetails.containsKey('currentUserId'))
        userAdditions.add(itemId);
    });

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), border: Border.all()),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (fromCommunity != null)
                Text(
                    'From ${fromCommunity.displayName}, ${fromCommunity.district}'),
              Text(
                '35% full',
                style: TextStyle(fontSize: 18.0, color: Colors.green),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Basket Contents',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              if (products.isNotEmpty)
                AvatarCatalogue(
                  avatarUrls: basket.items.keys
                      .take(4)
                      .map((itemId) => products[itemId]!.pictures[0] as String)
                      .toList(),
                )
            ],
          ),
          if (userAdditions.length > 0) ...[
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your additions',
                  style: TextStyle(fontSize: 18.0),
                ),
                AvatarCatalogue(
                    avatarUrls: userAdditions
                        .take(4)
                        .map(
                            (itemId) => products[itemId]!.pictures[0] as String)
                        .toList()),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

class AvatarCatalogue extends StatelessWidget {
  final List<String> avatarUrls;
  const AvatarCatalogue({Key? key, required this.avatarUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
