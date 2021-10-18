import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/helpers/image_helper.dart';
import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:lastsearch/providers/search_type_state.dart';
import 'package:lastsearch/views/result_detail_screen.dart';
import 'package:lastsearch/constants/globals.dart' as globals;

class SearchListing extends StatelessWidget {
  final String resultId;

  const SearchListing({
    Key? key,
    required this.resultId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchResult = Provider.of<SearchResultsProvider>(context).findById(resultId);
    final searchType = Provider.of<SearchTypeState>(context).getSearchType();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ResultDetailScreen.routeName,
          arguments: searchResult.id,
        );
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: globals.halfSpacer),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: ImageHelper().buildImage(searchResult.image),
            radius: 28,
          ),
          title: Text(
            searchResult.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline2,
          ),
          subtitle: searchType != SearchType.artist
              ? Text(
                  searchResult.artist!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline3,
                )
              : null,
        ),
      ),
    );
  }
}
