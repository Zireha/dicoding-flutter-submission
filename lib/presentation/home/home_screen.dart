import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/presentation/home/list_card.dart';
import 'package:restaurant_app/provider/home/home_list_provider.dart';
import 'package:restaurant_app/static/list_result_state.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<HomeListProvider>().fetchList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Restoran",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Consumer<HomeListProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            ListLoadingState() =>
              const Center(child: CircularProgressIndicator()),
            ListLoadedState(data: var restaurantList) => ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  final restaurants = restaurantList[index];

                  return ListCard(
                      restaurant: restaurants,
                      onTap: () {
                        Navigator.pushNamed(
                            context, NavigationRoute.detailScreen.name,
                            arguments: restaurants.id);
                      });
                },
              ),
            ListErrorState(error: var msg) => Center(
                child: Text(msg),
              ),
            _ => const SizedBox()
          };
        },
      ),
    );
  }
}
