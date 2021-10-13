import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;

class LSTheme {
  static final Map<int, Color> lsPrimarySwatch = {
    50: const Color.fromRGBO(185, 0, 0, .1),
    100: const Color.fromRGBO(185, 0, 0, .2),
    200: const Color.fromRGBO(185, 0, 0, .3),
    300: const Color.fromRGBO(185, 0, 0, .4),
    400: const Color.fromRGBO(185, 0, 0, .5),
    500: const Color.fromRGBO(185, 0, 0, .6),
    600: const Color.fromRGBO(185, 0, 0, .7),
    700: const Color.fromRGBO(185, 0, 0, .8),
    800: const Color.fromRGBO(185, 0, 0, .9),
    900: const Color.fromRGBO(185, 0, 0, 1),
  };

  static final MaterialColor lsPrimarySwatchMaterial = MaterialColor(0xFFb90000, lsPrimarySwatch);

  static const Color lastSearchRed = Color.fromRGBO(185, 0, 0, 1.0);
  static const Color lastSearchDark = Color.fromRGBO(17, 17, 17, 1.0);

  static final ThemeData mainTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: lastSearchDark,
      titleTextStyle: TextStyle(
        color: lastSearchRed,
        fontFamily: globals.defaultFontName,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
    ),
    primarySwatch: lsPrimarySwatchMaterial,
    backgroundColor: Colors.white,
    fontFamily: globals.defaultFontName,
    textTheme: ThemeData.light().textTheme.copyWith(
          headline1: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: lastSearchRed),
          headline2: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: lastSearchRed),
          bodyText1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: lastSearchDark),
          bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: lastSearchRed),
          subtitle1: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100, color: lastSearchDark),
        ),
  );
}
