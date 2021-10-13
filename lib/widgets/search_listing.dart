import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:lastsearch/screens/search_detail_screen.dart';
import 'package:lastsearch/constants/globals.dart' as globals;

class SearchListing extends StatelessWidget {
  final String resultId;

  const SearchListing({
    Key? key,
    required this.resultId,
  }) : super(key: key);

  ImageProvider<Object> buildAvatarImage(String? photoUrl) {
    if (photoUrl == null) {
      return const AssetImage(
        'assets/images/placeholder-image.jpeg',
      );
    }
    return NetworkImage(photoUrl);
  }

  @override
  Widget build(BuildContext context) {
    final searchResult = Provider.of<SearchResultsProvider>(context).findById(resultId);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          SearchDetailScreen.routeName,
          arguments: searchResult.id,
        );
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: globals.halfSpacer),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: buildAvatarImage(searchResult.url),
            radius: 28,
          ),
          title: Text(
            searchResult.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
