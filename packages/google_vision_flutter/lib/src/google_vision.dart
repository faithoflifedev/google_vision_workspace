import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;

class GoogleVision extends gv.GoogleVision {
  GoogleVision() : super();

  /// Create a new instance of [GoogleVision] with the given [assetFileName].
  static Future<gv.GoogleVision> withAsset(String assetFileName) async {
    final credentials = await rootBundle.loadString(assetFileName);

    return gv.GoogleVision.withJwt(credentials);
  }

  /// Create a new instance of [GoogleVision] with the given [apiKey].
  static gv.GoogleVision withApiKey(String apiKey) =>
      gv.GoogleVision.withApiKey(apiKey);
}
