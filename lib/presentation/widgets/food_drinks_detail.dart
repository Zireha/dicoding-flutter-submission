import 'package:flutter/material.dart';
import 'package:restaurant_app/data/response/detail_response.dart';

import 'menu_card.dart';

class FoodDrinksDetail extends StatelessWidget {
  final RestaurantDetail restaurantData;

  const FoodDrinksDetail({super.key, required this.restaurantData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Makanan",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        // TODO: Makanan disini
        SizedBox(
          height: 120,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: restaurantData.menus.foods.length,
              itemBuilder: (context, index) {
                final foods = restaurantData.menus.foods[index];

                return MenuCard(name: foods.name);
              }),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "Minuman",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        // TODO: Makanan disini
        SizedBox(
          height: 120,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: restaurantData.menus.drinks.length,
              itemBuilder: (context, index) {
                final foods = restaurantData.menus.drinks[index];

                return MenuCard(name: foods.name);
              }),
        ),
      ],
    );
  }
}
