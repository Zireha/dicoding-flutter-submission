import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/presentation/home/list_card.dart';
import 'package:restaurant_app/provider/provider/favorite_provider.dart';

import '../../static/navigation_route.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List Restoran Favorit",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        body: Consumer<FavoriteProvider>(builder: (context, provider, child) {
          final favorite = provider.favorite;
          if (favorite.isEmpty) {
            return Center(
              child: Text(
                "Ngga ada apa apa disini :(",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.grey[600]
                ),
              ),
            );
          }

          return ListView.builder(
              itemCount: favorite.length,
              itemBuilder: (context, index) {
                final restaurant = favorite[index];

                return ListCard(
                  restaurant: restaurant,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigationRoute.detailScreen.name,
                      arguments: restaurant.id,
                    );
                  },
                );
              });
        }));
  }
}
