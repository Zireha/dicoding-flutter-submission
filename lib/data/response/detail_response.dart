import 'dart:convert';
import 'package:restaurant_app/data/response/category_response.dart';
import 'customer_review_response.dart';
import 'menu_response.dart';

class DetailResponse {
  final bool error;
  final String message;
  final RestaurantDetail restaurant;

  DetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory DetailResponse.fromJson(String source) =>
      DetailResponse.fromMap(json.decode(source));

  factory DetailResponse.fromMap(Map<String, dynamic> map) {
    return DetailResponse(
      error: map['error'],
      message: map['message'],
      restaurant: RestaurantDetail.fromMap(map['restaurant']),
    );
  }
}

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromMap(Map<String, dynamic> map) {
    return RestaurantDetail(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      city: map['city'],
      address: map['address'],
      pictureId: map['pictureId'],
      categories: List<Category>.from(
          map['categories'].map((x) => Category.fromMap(x))),
      menus: Menus.fromMap(map['menus']),
      rating: map['rating'].toDouble(),
      customerReviews: List<CustomerReview>.from(
          map['customerReviews'].map((x) => CustomerReview.fromMap(x))),
    );
  }
}
