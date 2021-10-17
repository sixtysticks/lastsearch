import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/views/results_screen.dart';
import 'package:lastsearch/widgets/search_form_field.dart';
import 'package:lastsearch/widgets/search_radio_buttons.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: globals.halfSpacer,
          ),
          const SearchFormField(),
          const SizedBox(height: globals.halfSpacer),
          const SearchRadioButtons(),
          const SizedBox(
            height: globals.spacer,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResultsScreen(searchQuery: 'Dolly'),
                ),
              );
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
