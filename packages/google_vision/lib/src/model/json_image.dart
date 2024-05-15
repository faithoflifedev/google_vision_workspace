import 'dart:convert';
import 'dart:typed_data';

import 'package:universal_io/io.dart';

/// A class that holds the details of an image that can be converted to/from JSON.
class JsonImage {
  final String? imageUri;

  final ByteBuffer? byteBuffer;

  JsonImage({
    this.imageUri,
    this.byteBuffer,
  }) {
    if (imageUri == null && byteBuffer == null) {
      throw Exception('Invalid JsonImage');
    }
  }

  factory JsonImage.fromBuffer(ByteBuffer buffer) =>
      JsonImage(byteBuffer: buffer);

  factory JsonImage.fromGsUri(String gsUri) => JsonImage(imageUri: gsUri);

  factory JsonImage.fromFile(File file) =>
      JsonImage(byteBuffer: file.readAsBytesSync().buffer);

  factory JsonImage.fromFilePath(String fileNameAndPath) =>
      JsonImage(byteBuffer: File(fileNameAndPath).readAsBytesSync().buffer);

  factory JsonImage.fromJson(Map<String, dynamic> json) => JsonImage(
        byteBuffer: json.containsKey('content')
            ? base64.decode(json['content']).buffer
            : null,
        imageUri:
            json.containsKey('source') && json['source'].containsKey('imageUri')
                ? json['source']['imageUri']
                : null,
      );

  Map<String, dynamic> toJson() => byteBuffer != null
      ? {'content': base64Encode(byteBuffer!.asUint8List())}
      : {
          'source': {'imageUri': imageUri}
        };

  @override
  String toString() => json.encode(toJson());
}
