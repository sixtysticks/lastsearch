import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchQueryProvider with ChangeNotifier {
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  set searchQuery(String newValue) {
    _searchQuery = newValue;
    notifyListeners();
  }
}
