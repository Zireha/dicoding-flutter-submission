import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/static/detail_result_state.dart';

class DetailProvider extends ChangeNotifier {
  final ApiService _apiService;

  DetailProvider(this._apiService);

  DetailResultState _resultState = DetailNoneState();

  DetailResultState get resultState => _resultState;

  Future<void> fetchDetail(String id) async {
    try {
      _resultState = DetailLoadingState();
      notifyListeners();

      final result = await _apiService.getRestaurantDetail(id);

      if (result.error) {
        _resultState = DetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = DetailLoadedState(result.restaurant);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = DetailErrorState(e.toString());
      notifyListeners();
    }
  }
}
