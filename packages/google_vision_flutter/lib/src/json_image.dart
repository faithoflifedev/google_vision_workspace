import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;

/// A class that holds the details of an image that can be converted to/from JSON.
class JsonImage extends gv.JsonImage {
  /// Creates a new instance of [JsonImage].
  JsonImage({super.imageUri, super.byteBuffer}) {
    if (imageUri == null && byteBuffer == null) {
      throw Exception('Invalid JsonImage');
    }
  }

  /// Creates a new instance of [JsonImage] from an asset.
  static Future<JsonImage> fromAsset(String assetFileName) async {
    final byteData = await rootBundle.load(assetFileName);

    return JsonImage(byteBuffer: byteData.buffer);
  }
}
