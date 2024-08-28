import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

abstract class GoogleVisionBuilderBase extends StatelessWidget {
  final Future<gv.GoogleVision> googleVision;

  /// The error builder for the [GoogleVisionFileBuilder].
  final Widget Function(Object error)? onError;

  /// The loading builder for the [GoogleVisionFileBuilder].
  final Widget Function()? onLoading;

  /// The list of [Feature] to be used for the image annotation.
  final List<Feature> features;

  static GoogleVisionFutureResolver? _googleVisionFutureResolver;

  GoogleVisionFutureResolver get googleVisionResolver =>
      _googleVisionFutureResolver == null
          ? throw Exception(
              'GoogleVisionFutureResolver has not been initialized properly.')
          : _googleVisionFutureResolver!;

  /// Creates a new instance of [GoogleVisionBuilderBase].
  GoogleVisionBuilderBase({
    super.key,
    this.onError,
    this.onLoading,
    required this.googleVision,
    required this.features,
  }) {
    _googleVisionFutureResolver = GoogleVisionFutureResolver(
      googleVisionFuture: googleVision,
    );
  }

  /// Gets the list of [Feature] for the specified [AnnotationType].
  static List<Feature> getFeatures(
          AnnotationType annotationType, int maxResults) =>
      [
        Feature(
          maxResults: maxResults,
          type: annotationType,
        )
      ];
}
