import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SearchType { album, song, artist }

class SearchTypeState with ChangeNotifier {
  SearchType search;

  SearchTypeState({this.search = SearchType.album});

  SearchType getSearchType() => search;

  void changeSearchType(SearchType val) {
    search = val;
    notifyListeners();
  }
}
