import 'package:restaurant_app/data/model/restaurant.dart';

sealed class ListResultState {}

class ListNoneState extends ListResultState {}

class ListLoadingState extends ListResultState {}

class ListErrorState extends ListResultState {
  final String error;

  ListErrorState(this.error);
}

class ListLoadedState extends ListResultState {
  final List<Restaurant> data;

  ListLoadedState(this.data);
}
