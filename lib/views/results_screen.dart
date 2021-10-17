import 'package:flutter/material.dart';
import 'package:lastsearch/providers/search_type_state.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/providers/loading_state.dart';
import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:lastsearch/widgets/search_list.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = globals.resultsRoute;

  final String searchQuery;

  const ResultsScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadingStateProvider = Provider.of<LoadingState>(context, listen: false);
    var searchResultsProvider = Provider.of<SearchResultsProvider>(context, listen: false);
    var searchType = Provider.of<SearchTypeState>(context, listen: false).getSearchType();
    var dataFetched = searchResultsProvider.fetched;

    if (!dataFetched) {
      searchResultsProvider.fetchSearchResults(context).then((value) {
        loadingStateProvider.loading = false;
        searchResultsProvider.fetched = true;
      });
    }

    return WillPopScope(
      onWillPop: () async {
        loadingStateProvider.loading = true;
        searchResultsProvider.clearResults();
        searchResultsProvider.fetched = false;
        return true;
      },
      child: Consumer<LoadingState>(builder: (context, loadingProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${searchType.name} results'),
          ),
          body: Container(
            child: loadingProvider.loading
                ? Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  )
                : SearchList(
                    searchResults: Provider.of<SearchResultsProvider>(context).results,
                    emptyListMessage: 'No results found',
                  ),
          ),
        );
      }),
    );
  }
}
