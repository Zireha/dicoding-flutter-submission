import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/presentation/detail/detail_body.dart';
import 'package:restaurant_app/provider/detail/detail_provider.dart';
import 'package:restaurant_app/static/detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<DetailProvider>().fetchDetail(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            DetailLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            DetailLoadedState(data: var restaurantData) =>
              DetailBody(restaurantData: restaurantData),
            DetailErrorState(error: var msg) => Center(
                child: Text(msg),
              ),
            _ => const SizedBox()
          };
        },
      ),
    );
  }
}
