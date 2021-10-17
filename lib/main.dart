import 'package:flutter/material.dart';
import 'package:lastsearch/views/result_detail_screen.dart';
import 'package:lastsearch/views/results_screen.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/constants/theme.dart';
import 'package:lastsearch/providers/loading_state.dart';
import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:lastsearch/providers/search_type_state.dart';
import 'package:lastsearch/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoadingState()),
        ChangeNotifierProvider(create: (context) => SearchResultsProvider()),
        ChangeNotifierProvider(create: (context) => SearchTypeState()),
      ],
      child: MaterialApp(
        title: globals.appName,
        debugShowCheckedModeBanner: false,
        theme: LSTheme.mainTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          ResultsScreen.routeName: (context) => const ResultsScreen(searchQuery: ''),
          ResultDetailScreen.routeName: (context) => const ResultDetailScreen(),
        },
      ),
    );
  }
}
