import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/response/list_response.dart';
import 'package:restaurant_app/provider/favorite/favorite_provider.dart';

class ListCard extends StatelessWidget {
  final RestaurantElement restaurant;
  final Function() onTap;

  const ListCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, provider, child) {

        final isFavorite = provider.isFavorite(restaurant.id);

        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(color: Colors.brown.withAlpha(60)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 90,
                      minHeight: 90,
                      maxWidth: 90,
                      minWidth: 90,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.brown.withAlpha(100), width: 5)),
                        child: Image.network(
                          "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            const Icon(Icons.location_city),
                            Text(
                              restaurant.city,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            const Icon(Icons.star),
                            Text(
                              restaurant.rating.toString(),
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 32,
                      ),
                      onPressed: () {
                        provider.toggleFavoriteButton(restaurant);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
