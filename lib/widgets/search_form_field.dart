import 'package:flutter/material.dart';

import 'package:lastsearch/constants/theme.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;

  const SearchFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: Theme.of(context).textTheme.headline2,
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
    );
  }
}
