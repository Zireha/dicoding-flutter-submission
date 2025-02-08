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

  factory DetailResponse.fromJson(Map<String, dynamic> json) => DetailResponse(
    error: json["error"],
    message: json["message"],
    restaurant: Restaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant.toJson(),
  };
}
