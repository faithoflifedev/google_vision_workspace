import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;

class JsonImage extends gv.JsonImage {
  JsonImage({
    super.imageUri,
    super.byteBuffer,
  }) {
    if (imageUri == null && byteBuffer == null) {
      throw Exception('Invalid JsonImage');
    }
  }

  static Future<JsonImage> fromAsset(String assetFileName) async {
    final byteData = await rootBundle.load(assetFileName);

    return JsonImage(byteBuffer: byteData.buffer);
  }
}
