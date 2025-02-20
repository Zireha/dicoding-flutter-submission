import 'package:flutter/material.dart';
import 'package:restaurant_app/data/response/detail_response.dart';

class ReviewCard extends StatelessWidget {
  final RestaurantDetail restaurantData;

  const ReviewCard({super.key, required this.restaurantData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Review",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: restaurantData.customerReviews.length,
            itemBuilder: (context, index) {
              final review = restaurantData.customerReviews[index];

              return Card(
                child: SizedBox(
                  width: 240,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            const Icon(Icons.account_circle, size: 36.0),
                            Text(review.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(review.date,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text(review.review),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
