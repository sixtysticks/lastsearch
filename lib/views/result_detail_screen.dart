import 'package:flutter/material.dart';

import 'package:lastsearch/constants/globals.dart' as globals;
import 'package:lastsearch/helpers/image_helper.dart';
import 'package:lastsearch/providers/search_results_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultDetailScreen extends StatelessWidget {
  static const routeName = globals.resultDetail;

  const ResultDetailScreen({Key? key}) : super(key: key);

  void _launchURL(String url) async => await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    final searchResultId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedResult = Provider.of<SearchResultsProvider>(context, listen: false).findById(searchResultId);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: ImageHelper().buildImage(loadedResult.image),
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(globals.spacer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadedResult.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  loadedResult.artist != null
                      ? Text(
                          loadedResult.artist!,
                          style: Theme.of(context).textTheme.headline2,
                        )
                      : Container(),
                  const SizedBox(
                    height: globals.halfSpacer,
                  ),
                  ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                      child: Text(
                        'Check it out on last.fm',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      _launchURL(loadedResult.url);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
