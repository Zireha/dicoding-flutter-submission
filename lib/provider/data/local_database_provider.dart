import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/db/db_services.dart';
import 'package:restaurant_app/data/response/list_response.dart';


class LocalDatabaseProvider extends ChangeNotifier {
  final DBService _service;

  LocalDatabaseProvider(this._service);

  String _message = "";
  String get message => _message;

  List<RestaurantElement>? _restaurantList;
  List<RestaurantElement>? get restaurantList => _restaurantList;

  RestaurantElement? _restaurant;
  RestaurantElement? get restaurant => _restaurant;
}