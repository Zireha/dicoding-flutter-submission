import 'package:flutter/material.dart';
import 'package:restaurant_app/data/response/detail_response.dart';
import 'package:restaurant_app/presentation/widgets/food_drinks_detail.dart';
import 'package:restaurant_app/presentation/widgets/review_card.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';

class DetailBody extends StatelessWidget {
  final RestaurantDetail restaurantData;

  const DetailBody({super.key, required this.restaurantData});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          expandedHeight: 250,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://restaurant-api.dicoding.dev/images/large/${restaurantData.pictureId}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemainingBoxAdapter(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantData.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    const Icon(Icons.star),
                    Text(
                      restaurantData.rating.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    const Icon(
                      Icons.location_city,
                    ),
                    Text(restaurantData.city,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.location_on),
                    Text(
                      restaurantData.address,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ReviewCard(restaurantData: restaurantData),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Deskripsi",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  restaurantData.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                FoodDrinksDetail(restaurantData: restaurantData),
              ],
            ),
          ),
        )
      ],
    );
  }
}
