import 'package:flutter/material.dart';
import 'package:lastsearch/providers/loading_state.dart';
import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:lastsearch/providers/search_type_state.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/constants/theme.dart';
import 'package:lastsearch/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchTypeState()),
        ChangeNotifierProvider(create: (context) => SearchResultsProvider()),
        ChangeNotifierProvider(create: (context) => LoadingState()),
      ],
      child: MaterialApp(
        title: globals.appName,
        debugShowCheckedModeBanner: false,
        theme: LSTheme.mainTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
