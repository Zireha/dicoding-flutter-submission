import 'package:restaurant_app/data/model/restaurant.dart';

class DetailResponse {
  final bool error;
  final String message;
  final Restaurant restaurant;

  DetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });
}
