import 'package:flutter/material.dart';
import 'package:restaurant_app/data/db/db_services.dart';
import 'package:restaurant_app/data/response/list_response.dart';

class FavoriteProvider extends ChangeNotifier {

  final DBService _dbService = DBService();
  List<RestaurantElement> _favorites = [];

  List<RestaurantElement> get favorite => _favorites;

  Future<void> getFavoriteList() async {
    _favorites = await _dbService.getAllRestaurants();
    notifyListeners();
  }

  Future<void> toggleFavoriteButton(RestaurantElement restaurant) async {
    final isMarked = _favorites.any((e) => e.id == restaurant.id);

    if(isMarked) {
      await _dbService.deleteItem(restaurant);
      _favorites.removeWhere((e) => e.id == restaurant.id);
    } else {
      await _dbService.insertItem(restaurant);
      _favorites.add(restaurant);
    }

    notifyListeners();
  }

  bool isFavorite(String id) {
    return _favorites.any((e) => e.id == id);
  }

}