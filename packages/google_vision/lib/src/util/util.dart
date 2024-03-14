import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:image/image.dart' as img;
import 'package:universal_io/io.dart';

Function listEquality = const ListEquality().equals;

enum ImageEncoding {
  jpeg('JPEG', Util.jpegDecode),
  png('PNG', Util.pngDecode),
  gif('GIF', Util.gifDecode),
  bmp('BMP', Util.bmpDecode),
  ico('ICO', Util.icoDecode),
  tiff('TIFF', Util.tiffDecode);

  const ImageEncoding(this.type, this.decoder);

  final String type;

  final img.Image? Function(Uint8List, {int? frame}) decoder;
}

/// Utility methods
class Util {
  static String base64GCloudString(String data) =>
      Util.base64GCloudList(utf8.encode(data));

  static String base64GCloudList(List<int> data) => base64
      .encode(data)
      .replaceAll('/', '_')
      .replaceAll('+', '-')
      .replaceAll('=', '');

  static Map<String, img.Color> colorMap = {
    'red': img.ColorRgb8(255, 0, 0),
    'green': img.ColorRgb8(0, 255, 0),
    'blue': img.ColorRgb8(0, 0, 255),
    'white': img.ColorRgb8(255, 255, 255),
    'black': img.ColorRgb8(0, 0, 0),
  };

  /// Convert a [DateTime] to a Unix Timestamp.
  static int unixTimeStamp(DateTime dt) =>
      dt.toUtc().millisecondsSinceEpoch ~/ 1000;

  static T cast<T>(dynamic x, {required T fallback}) => x is T ? x : fallback;

  static String getUploadIdFromUrl(String locationUrl) {
    final locationUri = Uri.parse(locationUrl);

    if (!locationUri.queryParameters.containsKey('upload_id')) {
      throw Exception('The upload ID has not been found.');
    }

    return locationUri.queryParameters['upload_id']!;
  }

  /// Attempt to retrieve the 'home' folder of the user if running on a desktop.
  static String? get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  static ImageEncoding getImageEncoding(List<int> bytes) {
    Uint8List headerBytes = Uint8List.fromList(bytes.sublist(0,
        16)); // Adjust the size based on the maximum header size for the formats you're interested in.

    // Define known image file signatures
    Map<List<int>, ImageEncoding> signatures = {
      [0x42, 0x4D]: ImageEncoding.bmp,
      [0x47, 0x49, 0x46, 0x38, 0x37, 0x61]: ImageEncoding.gif,
      [0x47, 0x49, 0x46, 0x38, 0x39, 0x61]: ImageEncoding.gif,
      [0xFF, 0xD8, 0xFF]: ImageEncoding.jpeg,
      [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A]: ImageEncoding.png,
      [0x00, 0x00, 0x01, 0x00]: ImageEncoding.ico,
      [0x00, 0x00, 0x02, 0x00]: ImageEncoding.ico,
      [0x49, 0x49, 0x2A, 0x00]: ImageEncoding.tiff,
      [0x4D, 0x4D, 0x00, 0x2A]: ImageEncoding.tiff,
    };

    for (var signature in signatures.entries) {
      if (listEquality(signature.key, headerBytes)) {
        return signature.value;
      }
    }

    throw Exception('image format unknown');
  }

  static img.Image? bmpDecode(Uint8List bytes, {int? frame}) =>
      (img.BmpDecoder()).decode(bytes, frame: frame);

  static img.Image? gifDecode(Uint8List bytes, {int? frame}) =>
      (img.GifDecoder()).decode(bytes, frame: frame);

  static img.Image? icoDecode(Uint8List bytes, {int? frame}) =>
      (img.IcoDecoder()).decode(bytes, frame: frame);

  static img.Image? jpegDecode(Uint8List bytes, {int? frame}) =>
      (img.JpegDecoder()).decode(bytes, frame: frame);

  static img.Image? pngDecode(Uint8List bytes, {int? frame}) =>
      (img.PngDecoder()).decode(bytes, frame: frame);

  static img.Image? tiffDecode(Uint8List bytes, {int? frame}) =>
      (img.TiffDecoder()).decode(bytes, frame: frame);

  static img.Color convertColorNameToImageColor(String colorName) =>
      (colorMap.containsKey(colorName)
          ? colorMap[colorName]!
          : throw Exception('Invalid color name'));
}
