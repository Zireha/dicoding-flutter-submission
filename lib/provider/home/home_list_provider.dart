import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/static/list_result_state.dart';

class HomeListProvider extends ChangeNotifier {
  final ApiService _apiService;

  HomeListProvider(this._apiService);

  ListResultState _resultState = ListNoneState();

  ListResultState get resultState => _resultState;

  Future<void> fetchList() async {
    try {
      _resultState = ListLoadingState();
      notifyListeners();

      final result = await _apiService.getRestaurantList();

      if (result.error) {
        _resultState = ListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = ListLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = ListErrorState(e.toString());
      notifyListeners();
    }
  }
}
