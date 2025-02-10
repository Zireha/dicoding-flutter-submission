import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/response/list_response.dart';
import 'package:restaurant_app/presentation/home/list_card.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ListResponse> _futureListResponse;

  @override
  void initState() {
    _futureListResponse = ApiService().getRestaurantList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Restoran",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
      ),
      body: FutureBuilder(
          future: _futureListResponse,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                final restaurantList = snapshot.data!.restaurants;
                return ListView.builder(
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
                    });

              default:
                return const SizedBox();
            }
          }),
    );
  }
}
