import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/response/detail_response.dart';
import 'package:restaurant_app/presentation/detail/detail_body.dart';
import 'package:restaurant_app/presentation/detail/menu_card.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';

class DetailScreen extends StatefulWidget {

  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  final Completer<RestaurantDetail> _detailCompleter = Completer<RestaurantDetail>();
  late Future<DetailResponse> _futureDetailResponse;

  @override
  void initState() {
    _futureDetailResponse = ApiService().getRestaurantDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _futureDetailResponse,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {

              case ConnectionState.none:
                // TODO: Handle this case.
                throw UnimplementedError();
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                // TODO: Handle this case.
                throw UnimplementedError();
              case ConnectionState.done:
                if(snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString())
                  );
                }
                final restaurantData = snapshot.data!.restaurant;
                return DetailBody(restaurantData: restaurantData);
            }
          }),
    );
  }
}