import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckboxProvider extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  static const checkedKey = "is_checked";
  CheckboxProvider() {
    loadCheckboxState();
  }

  Future<void> loadCheckboxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isChecked = prefs.getBool(checkedKey) ?? false;
    notifyListeners();
  }

  Future<void> setCheckboxState(bool value) async {
    _isChecked = value;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(checkedKey, value);
  }
}