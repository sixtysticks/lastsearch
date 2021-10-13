import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/constants/theme.dart';

class SearchDetailScreen extends StatelessWidget {
  static const routeName = globals.resultsRoute;

  const SearchDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Search details screen.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: LSTheme.lastSearchDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
