import 'dart:convert' show json;

import 'package:google_vision/google_vision.dart' show Painter;

class Image {
  final String? imageUri;

  final Painter? painter;

  Image({
    this.imageUri,
    this.painter,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image();

  Map<String, dynamic> toJson() => painter != null
      ? painter!.toJson()
      : {
          'source': {'imageUri': imageUri}
        };

  @override
  String toString() => json.encode(toJson());
}
