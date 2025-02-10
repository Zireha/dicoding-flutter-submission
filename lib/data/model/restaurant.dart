// import 'package:restaurant_app/data/model/category.dart';
// import 'package:restaurant_app/data/model/customer_review.dart';
// import 'package:restaurant_app/data/model/menus.dart';
//
// class Restaurant {
//   final String id;
//   final String name;
//   final String description;
//   final String city;
//   final String address;
//   final String pictureId;
//   final double rating;
//   final List<Category> categories;
//   final Menus menu;
//   final List<CustomerReview> customerReviews;
//
//   Restaurant({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.city,
//     required this.address,
//     required this.pictureId,
//     required this.rating,
//     required this.categories,
//     required this.menu,
//     required this.customerReviews,
//   });
//
//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"] ?? "id",
//         name: json["name"] ?? "name",
//         description: json["description"] ?? "Desc",
//         city: json["city"] ?? "City",
//         address: json["address"] ?? "address",
//         pictureId: json["pictureId"] ?? "picId",
//         categories: json["categories"] != null ?
//             List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))) : <Category>[],
//         menu: Menus.fromJson(json["menus"]),
//         rating: json["rating"]?.toDouble(),
//         customerReviews: json["customerReviews"] != null ?
//         List<CustomerReview>.from(json["customerReviews"]!.map((x) => CustomerReview.fromJson(x))) : <CustomerReview>[]
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "city": city,
//         "address": address,
//         "pictureId": pictureId,
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "menus": menu.toJson(),
//         "rating": rating,
//         "customerReviews":
//             List<dynamic>.from(customerReviews.map((x) => x.toJson())),
//       };
// }
