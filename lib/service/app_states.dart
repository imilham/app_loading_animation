// import 'package:flutter/material.dart';

// class AppStatesServiceProvider extends ChangeNotifier {
//   // Private constructor
//   AppStatesServiceProvider._internal();

//   // Singleton instance
//   static final AppStatesServiceProvider _instance = AppStatesServiceProvider._internal();

//   // Factory constructor to return the same instance
//   factory AppStatesServiceProvider() => _instance;

//   // Fields and methods
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   set isLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }

//   void get showLoader {
//     _isLoading = true;
//     notifyListeners();
//   }

//   void get hideLoader {
//     _isLoading = false;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

class AppStatesServiceProvider extends ChangeNotifier {
  // Private constructor to prevent external instantiation
  AppStatesServiceProvider._internal();

  // Singleton instance accessible via the `instance` property
  static final AppStatesServiceProvider instance = AppStatesServiceProvider._internal();

  // Fields and methods
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Regular methods for loader control
  void showLoader() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoader() {
    _isLoading = false;
    notifyListeners();
  }
}