import 'dart:convert';
import 'dart:typed_data';

class JsonImage {
  final String? imageUri;

  final ByteBuffer? byteBuffer;

  JsonImage({
    this.imageUri,
    this.byteBuffer,
  });

  factory JsonImage.fromJson(Map<String, dynamic> json) => JsonImage();

  Map<String, dynamic> toJson() => byteBuffer != null
      ? {'content': base64Encode(byteBuffer!.asUint8List())}
      : {
          'source': {'imageUri': imageUri}
        };

  @override
  String toString() => json.encode(toJson());
}
