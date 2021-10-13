import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchResult with ChangeNotifier {
  final String id;
  final String name;
  final String url;
  final String image;
  final String? artist;

  SearchResult({
    this.id = '',
    required this.name,
    required this.url,
    required this.image,
    this.artist,
  });
}
