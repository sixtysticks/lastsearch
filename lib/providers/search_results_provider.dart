import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:lastsearch/providers/search_type_state.dart';

import 'package:lastsearch/models/search_result.dart';

class SearchResultsProvider with ChangeNotifier {
  bool _hasFetchedData = false;
  bool get fetched => _hasFetchedData;

  set fetched(bool newValue) {
    _hasFetchedData = newValue;
    notifyListeners();
  }

  List<SearchResult> _results = [];

  Future<void> fetchSearchResults(BuildContext context) async {
    try {
      final searchType = Provider.of<SearchTypeState>(context).getSearchType();

      // ignore: prefer_typing_uninitialized_variables
      var searchCategory;

      switch (searchType) {
        case SearchType.album:
          searchCategory = 'album';
          break;
        case SearchType.track:
          searchCategory = 'track';
          break;
        case SearchType.artist:
          searchCategory = 'artist';
          break;
      }

      final uri = 'https://ws.audioscrobbler.com/2.0/?method=$searchCategory.search&$searchCategory=oasis&api_key=7e7f8ba22c77bec674a8545942e11a40&format=json';

      final response = await http.get(Uri.parse(uri));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final searchItems = extractedData['results']['${searchCategory}matches'][searchCategory];

      final List<SearchResult> fetchedResults = [];

      var uuid = const Uuid();

      searchItems.forEach((resultData) {
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
