import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/models/search_result.dart';
import 'package:lastsearch/widgets/search_listing.dart';

class SearchList extends StatelessWidget {
  final List<SearchResult> searchResults;
  final String emptyListMessage;

  const SearchList({
    Key? key,
    required this.searchResults,
    required this.emptyListMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: searchResults.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(globals.spacer),
                      child: Text(
                        emptyListMessage,
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: Colors.grey,
              ),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: searchResults[index],
                  child: SearchListing(resultId: searchResults[index].id),
                );
              },
            ),
    );
  }
}
