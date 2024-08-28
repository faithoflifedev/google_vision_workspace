import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_converter/flutter_image_converter.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

/// this class is used to remove the use of nested FutureBuilders.  It resolves
/// the [GoogleVision] authentication future and the [InputConfig] or
/// [ImageProvider] future, allowing the final GoogleVision API call to be
/// provided as the final future as would be expected by the user.
class GoogleVisionFutureResolver {
  /// The final [GoogleVision] object that is resolved from the [googleVisionFuture].
  late final gv.GoogleVision? _googleVision;

  /// The future that resolves the [GoogleVision] object.
  final Future<gv.GoogleVision> googleVisionFuture;

  /// The [ImageProvider] that is used to provide the image data for the API
  /// call.
  final ImageProvider? imageProvider;

  /// The future that resolves the [InputConfig] object.
  final Future<InputConfig>? inputConfigFuture;

  /// Error message for when the [GoogleVision] object has not been initialized
  /// properly.
  static const inputConfigError =
      'InputConfig has not been initialized properly.';

  /// Error message for when the [ImageProvider] object has not been initialized
  /// properly.
  static const imageProviderError =
      'ImageProvider has not been initialized properly.';

  gv.GoogleVision get googleVision =>
      _googleVision ??
      (throw Exception('GoogleVision has not been initialized properly.'));

  /// Constructor for the [GoogleVisionFutureResolver] class.
  GoogleVisionFutureResolver({
    required this.googleVisionFuture,
    this.imageProvider,
    this.inputConfigFuture,
  });

  @Deprecated('Use resolveImage instead')

  /// Resolves the [GoogleVision] object and the [ImageProvider] object for use
  /// by the FutureBuilder.
  Future<AnnotatedResponses> resolve(
    AnnotationRequests Function(ByteBuffer?) requestFunction, {
    String? parent,
  }) async {
    _googleVision = await googleVisionFuture;

    if (imageProvider == null) {
      throw Exception(imageProviderError);
    }

    final byteData = await imageProvider!.pngByteData;

    return googleVision.annotate(
      requests: requestFunction(byteData.buffer),
      parent: parent,
    );
  }

  /// Resolves the [GoogleVision] object and the [ImageProvider] object for use
  /// by the FutureBuilder.
  Future<BatchAnnotateImagesResponse> resolveImage(
    List<AnnotateImageRequest> Function(ByteBuffer?) requestFunction, {
    String? parent,
  }) async {
    _googleVision = await googleVisionFuture;

    if (imageProvider == null) {
      throw Exception(imageProviderError);
    }

    final byteData = await imageProvider!.pngByteData;

    return googleVision.image.annotate(
      requests: requestFunction(byteData.buffer),
      parent: parent,
    );
  }

  /// Resolves the [GoogleVision] object and the [InputConfig] object for use by
  /// the FutureBuilder.
  Future<BatchAnnotateFilesResponse> resolveFile(
    List<AnnotateFileRequest> Function(InputConfig) requestFunction, {
    String? parent,
  }) async {
    _googleVision = await googleVisionFuture;

    if (inputConfigFuture == null) {
      throw Exception(inputConfigError);
    }

    final inputConfig = await inputConfigFuture;

    if (inputConfig == null) {
      throw Exception(inputConfigError);
    }

    return googleVision.file.annotate(
      requests: requestFunction(inputConfig),
      parent: parent,
    );
  }
}
