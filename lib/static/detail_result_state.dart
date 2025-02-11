import 'package:restaurant_app/data/response/detail_response.dart';

sealed class DetailResultState {}

class DetailNoneState extends DetailResultState {}

class DetailLoadingState extends DetailResultState {}

class DetailErrorState extends DetailResultState {
  final String error;

  DetailErrorState(this.error);
}

class DetailLoadedState extends DetailResultState {
  final RestaurantDetail data;

  DetailLoadedState(this.data);
}
