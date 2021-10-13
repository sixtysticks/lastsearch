import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:lastsearch/models/search_result.dart';

class SearchResultsProvider with ChangeNotifier {
  List<SearchResult> _results = [];

  Future<void> fetchSearchResults() async {
    try {
      final response = await http.get(Uri.parse('https://ws.audioscrobbler.com/2.0/?method=album.search&album=darkness&api_key=7e7f8ba22c77bec674a8545942e11a40&format=json'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final matches = extractedData['albummatches'];

      print(matches);
      // final List<SearchResult> fetchedResults = [];
      // extractedData.forEach((resultId, resultData) {
      //   fetchedResults.add(
      //     SearchResult(
      //       id: resultId,
      //       name: resultData['name'],
      //       url: resultData['tagline'],
      //       image: resultData['image'],
      //       artist: resultData['artist'],
      //     ),
      //   );
      // });
      // _results = fetchedResults;
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
}
