import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart' as widget;
import 'package:flutter_image_converter/flutter_image_converter.dart';
import 'package:image/image.dart' as image;

extension ImageConverterOnWidgetImageExt on widget.Image {
  /// Constructs an [image.Image] from [widget.Image].
  Future<image.Image> get imageImage async => imageProvider.imageImage;

  /// Constructs an [ui.Image] from [widget.Image].
  Future<ui.Image> get uiImage async => imageProvider.uiImage;

  widget.ImageProvider get imageProvider => this.image;

  /// Use PNG format.
  Future<Uint8List> get uint8List async => imageProvider.pngUint8List;

  /// Converts [uint8List] to BMP format if needed.
  Future<Uint8List> get bmpUint8List async => (await uint8List).bmpUint8List;

  /// Converts [uint8List] to PNG format if needed.
  /// Alias for [uint8List].
  Future<Uint8List> get pngUint8List async => uint8List;

  /// Use PNG format.
  Future<ByteData> get pngByteData async => imageProvider.pngByteData;
}
