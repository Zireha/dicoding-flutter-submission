import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 90,
              minHeight: 90,
              maxWidth: 120,
              minWidth: 120,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Restaurant',
                style: Theme.of(context).textTheme.titleLarge,

              ),
              Row(
                spacing: 4,
                children: [
                  const Icon(Icons.location_on),
                  Text(
                    'Lokasi',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  const Icon(Icons.star),
                  Text('4.5', style: Theme.of(context).textTheme.labelSmall,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
