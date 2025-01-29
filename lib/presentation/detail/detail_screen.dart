import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/detail/menu_card.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 250,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://images.unsplash.com/photo-1556742205-e10c9486e506?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fuji Restaurant",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black87,
                        ),
                        Text("Lokasi",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.black.withAlpha(192)))
                      ],
                    ),
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tincidunt eros nisl, a sagittis tortor malesuada ut. Integer in libero at risus vulputate tincidunt.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Makanan",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 12),
                    // TODO: Bikin list menu
                    const MenuCard()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
