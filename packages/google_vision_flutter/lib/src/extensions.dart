import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

/// Extension methods for the [ImageProvider] class.
extension ImageProviderExt on ImageProvider {
  /// Returns the image dimensions.
  @Deprecated('Use getImageInfo instead')
  Future<ImageDetail> getImageDetails(
      {ImageByteFormat format = ImageByteFormat.rawRgba}) async {
    Completer<ImageDetail> completer = Completer<ImageDetail>();

    resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo imageInfo, bool _) async {
      final byteData = await imageInfo.image.toByteData(format: format);

      final dimensions = ImageDetail(
        width: imageInfo.image.width,
        height: imageInfo.image.height,
        byteBuffer: byteData?.buffer,
      );

      completer.complete(dimensions);
    }));

    return await completer.future;
  }

  /// Converts the image to a [ByteBuffer].
  Future<ByteBuffer?> toByteBuffer(
      {ImageByteFormat format = ImageByteFormat.rawRgba}) async {
    final completer = Completer<ByteBuffer?>();

    return _doCompletion<ByteBuffer>(ImageStreamListener(
      (imageInfo, synchronousCall) async {
        final byteData = await imageInfo.image.toByteData(format: format);

        completer.complete(byteData?.buffer);
      },
    ));
  }

  /// Returns the [ImageInfo].
  Future<ImageInfo> getImageInfo() {
    final completer = Completer<ImageInfo>();

    return _doCompletion<ImageInfo>(ImageStreamListener(
      (imageInfo, synchronousCall) {
        if (!completer.isCompleted) {
          completer.complete(imageInfo);
        }
      },
    ));
  }

  Future<T> _doCompletion<T>(ImageStreamListener imageListener) async {
    final imageStream = resolve(ImageConfiguration.empty);

    final completer = Completer<T>();

    imageStream.addListener(imageListener);

    final image = await completer.future;

    imageStream.removeListener(imageListener);

    return image;
  }
}

/// Extension methods for the [Vertex] class.
extension VertexExt on Vertex {
  /// adjust the offset to the size of the displayed image
  Offset toResizedOffset({
    double heightRatio = 1,
    double widthRatio = 1,
  }) =>
      Offset(x.toDouble() * widthRatio, y.toDouble() * heightRatio);

  Offset toOffset() => toResizedOffset();
}

/// Extension methods for the [NormalizedVertex] class.
extension VertexNormalizedExt on NormalizedVertex {
  /// [size] is the size of the image when displayed
  Offset toResizedOffset(Size size) =>
      Offset(x.toDouble() * size.width, y.toDouble() * size.height);
}
