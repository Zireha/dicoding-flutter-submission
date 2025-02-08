import 'package:restaurant_app/data/model/restaurant.dart';

class ListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  ListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory ListResponse.fromJson(Map<String, dynamic> json) {
    return ListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
        restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
    );
  }
}