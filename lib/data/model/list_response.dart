import 'package:restaurant_app/data/model/restaurant.dart';

class ListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurant;

  ListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurant,
  });
}