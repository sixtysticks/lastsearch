import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:provider/provider.dart';

class ResultDetailScreen extends StatelessWidget {
  static const routeName = globals.resultDetail;

  const ResultDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchResultId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedResult = Provider.of<SearchResultsProvider>(context, listen: false).findById(searchResultId);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(globals.spacer),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loadedResult.name,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
