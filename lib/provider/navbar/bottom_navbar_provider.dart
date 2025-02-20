import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/favorites/favorite_screen.dart';
import 'package:restaurant_app/presentation/home/home_screen.dart';

class BottomNavProvider with ChangeNotifier {
  List<NavDTO> items = [
    NavDTO(labelName: "Home", iconData: Icons.home, widget: const HomeScreen()),
    NavDTO(
        labelName: "Favorit",
        iconData: Icons.favorite,
        widget: const FavoriteScreen()),
  ];

  int _currIndex = 0;

  int get currentIndex => _currIndex;

  set currentIndex(int index) {
    _currIndex = index;
    notifyListeners();
  }
}

class NavDTO {
  Widget? widget;
  String? labelName;
  IconData? iconData;

  NavDTO({this.widget, this.labelName, this.iconData});
}
