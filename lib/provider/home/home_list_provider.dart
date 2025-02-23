import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/static/list_result_state.dart';

import '../notification/local_notification_provider.dart';

class HomeListProvider extends ChangeNotifier {
  final ApiService _apiService;

  HomeListProvider(this._apiService);

  ListResultState _resultState = ListNoneState();

  ListResultState get resultState => _resultState;

  Future<void> fetchList(BuildContext context) async {
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

        Provider.of<LocalNotificationProvider>(context, listen: false)
            .updateRestaurantData(result.restaurants);
      }
    } on Exception catch (e) {
      _resultState = ListErrorState(e.toString());
      notifyListeners();
    }
  }
}
