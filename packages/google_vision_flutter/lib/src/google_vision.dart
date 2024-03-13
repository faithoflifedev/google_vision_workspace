import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;

class GoogleVision extends gv.GoogleVision {
  GoogleVision() : super();

  /// Create a new instance of [GoogleVision] with the given [credentials] provided as an Asset name.
  static Future<gv.GoogleVision> withAsset(String assetFileName) async {
    final credentials = await rootBundle.loadString(assetFileName);

    return gv.GoogleVision.withJwt(credentials);
  }
}
