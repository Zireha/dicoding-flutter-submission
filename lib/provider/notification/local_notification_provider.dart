import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/notification/local_notification_service.dart';
import 'package:restaurant_app/data/response/list_response.dart';
import 'package:restaurant_app/utils/utils.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotifService;

  LocalNotificationProvider(this.flutterNotifService);
  
  int _notifId = 1;
  bool? _permiss = false;
  List<RestaurantElement> _restaurants = [];

  bool? get permission => _permiss;
  int get notifId => _notifId;
  List<RestaurantElement> get restaurants => _restaurants;


  Future<void> requestPermission() async {
    _permiss = await flutterNotifService.requestPermission();
    notifyListeners();
  }

  void updateRestaurantData(List<RestaurantElement> restaurants) {
    _restaurants = restaurants;
    notifyListeners();
  }

  void scheduleDailyElevenAMNotification(List<RestaurantElement> restaurants) {
    if (_restaurants.isEmpty) return;

    _notifId += 1;
    final restaurantName = _restaurants[getRandomNumber(restaurants.length)]
        .name;

    flutterNotifService.scheduleDailyElevenAMNotification(
        id: _notifId, restaurantName: restaurantName);
  }

  Future<void> cancelNotif(int id) async {
    await flutterNotifService.cancelNotif(id);
  }

  void showNotification() {
    _notifId += 1;
    flutterNotifService.showNotif(
        id: _notifId,
        title: "New Notification",
        body: "This is new notif with id $_notifId",
        payload: "this is the payload with id $_notifId"
    );
  }
}