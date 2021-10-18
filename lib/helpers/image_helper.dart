import 'package:flutter/widgets.dart';

class ImageHelper {
  ImageProvider<Object> buildImage(String? photoUrl) {
    if (photoUrl == null || photoUrl == "") {
      return const AssetImage(
        'assets/images/placeholder-image.jpeg',
      );
    }
    return NetworkImage(photoUrl);
  }
}
