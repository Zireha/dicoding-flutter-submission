import 'dart:convert';

import 'package:restaurant_app/data/response/detail_response.dart';
import 'package:restaurant_app/data/response/list_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<ListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return ListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<DetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return DetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load detail");
    }
  }
}
