import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/constants/theme.dart';
import 'package:lastsearch/providers/loading_state.dart';
import 'package:lastsearch/providers/search_type_state.dart';
import 'package:lastsearch/screens/results_screen.dart';
import 'package:lastsearch/widgets/search_radio.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = globals.homeRoute;

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final contentHeight = MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text(globals.appName),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SizedBox(
        height: contentHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(globals.spacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Choose whether to search Last.fm for album, song or artist',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: LSTheme.lastSearchDark,
                ),
              ),
              const SizedBox(
                height: globals.halfSpacer,
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: globals.halfSpacer,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: LSTheme.lastSearchDark,
                      ),
                      decoration: InputDecoration(
                        labelText: null,
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: LSTheme.lastSearchDark, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: LSTheme.lastSearchRed, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: LSTheme.lastSearchRed, width: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: globals.halfSpacer),
                    const SearchRadio(
                      title: 'Album',
                      value: SearchType.album,
                    ),
                    const SearchRadio(
                      title: 'Song',
                      value: SearchType.song,
                    ),
                    const SearchRadio(
                      title: 'Artist',
                      value: SearchType.artist,
                    ),
                    const SizedBox(
                      height: globals.spacer,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultsScreen(searchQuery: 'Dolly')));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
