import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;

class GoogleVision extends gv.GoogleVision {
  GoogleVision() : super();

  static Future<gv.GoogleVision> withAsset(String assetFileName) async {
    final credentials = await rootBundle.loadString(assetFileName);

    return gv.GoogleVision.withJwt(credentials);
  }
}
