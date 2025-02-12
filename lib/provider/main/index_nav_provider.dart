import 'package:flutter/widgets.dart';

class IndexNavProvider extends ChangeNotifier {
  int _indexBottomNavbar = 0;

  int get indexBottomNavbar => _indexBottomNavbar;

  set setIndexBottomNavbar(int val) {
    _indexBottomNavbar = val;
    notifyListeners();
  }
}
