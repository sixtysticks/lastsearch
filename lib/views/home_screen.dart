import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/widgets/search_form.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = globals.homeRoute;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(globals.appName),
      ),
      body: Container(
        padding: const EdgeInsets.all(globals.spacer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose whether to search last.fm for album, track or artist',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: globals.halfSpacer,
            ),
            const SearchForm(),
          ],
        ),
      ),
    );
  }
}
