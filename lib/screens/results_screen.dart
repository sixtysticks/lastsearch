import 'package:flutter/material.dart';
import 'package:lastsearch/providers/loading_state.dart';
import 'package:lastsearch/widgets/search_list.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
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
    var loadingStateProvider = Provider.of<LoadingState>(context, listen: false);
    var dataFetched = searchResultsProvider.fetched;

    if (!dataFetched) {
      searchResultsProvider.fetchSearchResults().then((value) {
        searchResultsProvider.fetched = true;
        loadingStateProvider.loading = false;
      });
    }

    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final contentHeight = MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;

    return WillPopScope(
      onWillPop: () async {
        searchResultsProvider.clearResults();
        searchResultsProvider.fetched = false;
        loadingStateProvider.loading = true;
        return true;
      },
      child: Consumer<LoadingState>(builder: (context, loadingProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          body: SizedBox(
            height: contentHeight,
            width: double.infinity,
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
