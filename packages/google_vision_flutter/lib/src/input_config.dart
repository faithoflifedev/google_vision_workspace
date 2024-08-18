import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;

/// A class that holds the details of an image that can be converted to/from JSON.
class InputConfig extends gv.InputConfig {
  /// Creates a new instance of [InputConfig].
  InputConfig({
    super.gcsSource,
    super.content,
    required super.mimeType,
  }) {
    if (gcsSource == null && content == null) {
      throw Exception('Invalid InputConfig');
    }
  }

  /// Creates a new instance of [InputConfig] from an asset.
  static Future<InputConfig> fromAsset(String assetFileName) async {
    final byteData = await rootBundle.load(assetFileName);

    return InputConfig(
      content: byteData.buffer,
      mimeType: gv.InputConfig.mimeTypeFromFileName(assetFileName),
    );
  }
}
