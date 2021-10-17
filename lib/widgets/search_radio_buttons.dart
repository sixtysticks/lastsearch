import 'package:flutter/material.dart';
import 'package:lastsearch/providers/search_type_state.dart';
import 'package:lastsearch/widgets/search_radio.dart';

class SearchRadioButtons extends StatelessWidget {
  const SearchRadioButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchRadio(
          title: 'Album',
          value: SearchType.album,
        ),
        SearchRadio(
          title: 'Track',
          value: SearchType.track,
        ),
        SearchRadio(
          title: 'Artist',
          value: SearchType.artist,
        ),
      ],
    );
  }
}
