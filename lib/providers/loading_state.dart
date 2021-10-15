import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingState with ChangeNotifier {
  bool _isLoading = true;

  bool get loading => _isLoading;

  set loading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }
}
