import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/constants/theme.dart';
import 'package:lastsearch/providers/search_results_provider.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = globals.resultsRoute;

  final String searchQuery;

  const ResultsScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchResultsProvider = Provider.of<SearchResultsProvider>(context, listen: false);
    var results = searchResultsProvider.results;

    searchResultsProvider.fetchSearchResults();

    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final contentHeight = MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text(globals.resultsTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SizedBox(
        height: contentHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(globals.spacer),
          child: results.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Search results.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: LSTheme.lastSearchDark,
                        ),
                      ),
                    ],
                  ),
                )
              : const Text('no results'),
        ),
      ),
    );
  }
}
