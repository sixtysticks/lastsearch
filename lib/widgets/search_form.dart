import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/providers/search_query_provider.dart';
import 'package:lastsearch/views/results_screen.dart';
import 'package:lastsearch/widgets/search_form_field.dart';
import 'package:lastsearch/widgets/search_radio_buttons.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchFieldController = TextEditingController();

    AlertDialog alert = AlertDialog(
      title: Text(
        'Search box is empty!',
        style: Theme.of(context).textTheme.headline1,
      ),
      content: Text(
        'Please enter an album, track or artist to search',
        style: Theme.of(context).textTheme.headline3,
      ),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: globals.halfSpacer,
          ),
          SearchFormField(controller: searchFieldController),
          const SizedBox(height: globals.halfSpacer),
          const SearchRadioButtons(),
          const SizedBox(
            height: globals.spacer,
          ),
          ElevatedButton(
            onPressed: () {
              var searchQueryProvider = Provider.of<SearchQueryProvider>(context, listen: false);
              searchQueryProvider.searchQuery = searchFieldController.text;

              if (searchFieldController.text.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultsScreen(),
                    ));
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Text(
                'Search',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
