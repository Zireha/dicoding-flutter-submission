import 'package:restaurant_app/data/model/restaurant.dart';

sealed class DetailResultState {}

class DetailNoneState extends DetailResultState {}

class DetailLoadingState extends DetailResultState {}

class DetailErrorState extends DetailResultState {
  final String error;

  DetailErrorState(this.error);
}

class DetailLoadedState extends DetailResultState {
  final Restaurant data;

  DetailLoadedState(this.data);
}
