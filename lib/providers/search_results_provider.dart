import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:lastsearch/models/search_result.dart';

class SearchResultsProvider with ChangeNotifier {
  bool _hasFetchedData = false;
  bool get fetched => _hasFetchedData;

  set fetched(bool newValue) {
    _hasFetchedData = newValue;
    notifyListeners();
  }

  List<SearchResult> _results = [];

  Future<void> fetchSearchResults() async {
    try {
      final response = await http.get(Uri.parse('https://ws.audioscrobbler.com/2.0/?method=album.search&album=darkness&api_key=7e7f8ba22c77bec674a8545942e11a40&format=json'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final albums = extractedData['results']['albummatches']['album'];
      final List<SearchResult> fetchedResults = [];

      var uuid = const Uuid();

      albums.forEach((resultData) {
        fetchedResults.add(
          SearchResult(
            id: uuid.v4(),
            name: resultData['name'],
            url: resultData['url'],
            image: resultData['image'][3]['#text'],
            artist: resultData['artist'],
          ),
        );
      });

      _results = fetchedResults;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  List<SearchResult> get results {
    return [..._results];
  }

  SearchResult findById(String resultId) {
    return _results.firstWhere((result) => result.id == resultId);
  }

  List<SearchResult> clearResults() {
    _results = [];
    return _results;
  }
}
