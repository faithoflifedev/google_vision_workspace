import 'dart:convert';
import 'dart:typed_data';

import 'package:color/color.dart';
import 'package:image/image.dart' as img;
import 'package:universal_io/io.dart';

class Image {
  final Uint8List encodedBytes;

  final String content;

  img.Image? _decodedBytes;

  Image(this.encodedBytes)
      : content = base64Encode(encodedBytes),
        _decodedBytes = img.decodeImage(encodedBytes);

  int get height => _decodedBytes!.height;

  int get width => _decodedBytes!.width;

  factory Image.fromFilePath(String filePath) => Image.fromFile(File(filePath));

  factory Image.fromFile(File imageFile) => Image(imageFile.readAsBytesSync());

  factory Image.fromDecodedImage(img.Image image) =>
      Image(Uint8List.fromList(img.encodeJpg(image).toList()));

  factory Image.fromBase64(String encodedImage) =>
      Image(base64Decode(encodedImage));

  factory Image.fromJson(Map<String, dynamic> json) =>
      Image.fromBase64(json['content'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'content': base64Encode(encodedBytes)};

  void drawLine(int x1, int y1, int x2, int y2, Color color,
      {bool antialias = false, num thickness = 1}) {
    img.drawLine(
        _decodedBytes!,
        x1,
        y1,
        x2,
        y2,
        img.getColor(color.toRgbColor().r as int, color.toRgbColor().g as int,
            color.toRgbColor().b as int));
  }

  void drawString(int x, int y, String text,
      {Color color = const Color.rgb(0, 0, 0)}) {
    img.drawString(_decodedBytes!, img.arial_14, x, y, text,
        color: img.getColor(color.toRgbColor().r as int,
            color.toRgbColor().g as int, color.toRgbColor().b as int));
  }

  Image copyCrop(int x, int y, int w, int h) =>
      Image.fromDecodedImage(img.copyCrop(_decodedBytes!, x, y, w, h));

  Future<void> writeAsJpeg(String filePath) async =>
      File(filePath).writeAsBytes(img.encodeJpg(_decodedBytes!));

  @override
  String toString() => jsonEncode(toJson());
}
