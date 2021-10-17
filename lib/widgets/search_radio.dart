import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lastsearch/constants/theme.dart';
import 'package:lastsearch/providers/search_type_state.dart';

class SearchRadio extends StatelessWidget {
  final String _title;
  final SearchType _value;

  const SearchRadio({
    Key? key,
    required String title,
    required SearchType value,
  })  : _title = title,
        _value = value,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchTypeState _searchTypeState = Provider.of<SearchTypeState>(context);
    SearchType _search = _searchTypeState.getSearchType();

    return ListTile(
      title: Text(
        _title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: LSTheme.lastSearchDark),
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      leading: Radio<SearchType>(
        value: _value,
        groupValue: _search,
        onChanged: (value) {
          _searchTypeState.changeSearchType(value!);
        },
      ),
    );
  }
}
