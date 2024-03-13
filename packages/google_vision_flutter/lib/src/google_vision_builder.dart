import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide GoogleVision, JsonImage;

/// A widget that builds a [GoogleVision] instance.
class GoogleVisionBuilder extends StatelessWidget {
  final Future<GoogleVision> googleVision;

  /// The [ImageProvider] to be used for the image annotation.
  final ImageProvider imageProvider;

  /// The list of [Feature] to be used for the image annotation.
  final List<Feature> features;

  /// The builder for the [GoogleVisionBuilder].
  final Widget Function(
    BuildContext context,
    AsyncSnapshot<AnnotatedResponses> snapshot,
    ImageDetail imageDetail,
  ) builder;

  /// The error builder for the [GoogleVisionBuilder].
  final Widget Function(Object error)? onError;

  /// The loading builder for the [GoogleVisionBuilder].
  final Widget Function()? onLoading;

  /// Creates a new instance of [GoogleVisionBuilder].
  const GoogleVisionBuilder({
    super.key,
    required this.googleVision,
    required this.imageProvider,
    required this.features,
    required this.builder,
    this.onError,
    this.onLoading,
    int maxResults = 10,
  });

  /// Creates a new instance of [GoogleVisionBuilder] for crop hint detections.
  factory GoogleVisionBuilder.cropHints({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, CropHintsAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.cropHintsAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.cropHints, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for document text detections.
  factory GoogleVisionBuilder.documentTextDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, FullTextAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.fullTextAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features:
            _getFeatures(AnnotationType.documentTextDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for face detections.
  factory GoogleVisionBuilder.faceDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<FaceAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.faceAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.faceDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for image properties detection.
  factory GoogleVisionBuilder.imageProperties({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
            BuildContext, ImagePropertiesAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.imagePropertiesAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.imageProperties, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for label detections.
  factory GoogleVisionBuilder.labelDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.labelAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.labelDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for landmark detections.
  factory GoogleVisionBuilder.landmarkDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.landmarkAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.landmarkDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for logo detections.
  factory GoogleVisionBuilder.logoDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.logoAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.logoDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for object localization detections.
  factory GoogleVisionBuilder.objectLocalization({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
            BuildContext, List<LocalizedObjectAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.localizedObjectAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.objectLocalization, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for product search detections.
  factory GoogleVisionBuilder.productSearch({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, ProductSearchResults?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.productSearchResults,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.productSearch, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for safe search detections.
  factory GoogleVisionBuilder.safeSearchDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, SafeSearchAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.safeSearchAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.safeSearchDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for text detections.
  factory GoogleVisionBuilder.textDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.textAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.textDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for web detections.
  factory GoogleVisionBuilder.webDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, WebDetection?, ImageDetail) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            _checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.webDetection,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: _getFeatures(AnnotationType.webDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Wait for two futures to complete concurrently.
  Future<(T1, T2)> waitConcurrently<T1, T2>(
    Future<T1> future1,
    Future<T2> future2,
  ) async {
    late T1 result1;
    late T2 result2;

    await Future.wait([
      future1.then((value) => result1 = value),
      future2.then((value) => result2 = value)
    ]);

    return Future.value((result1, result2));
  }

  /// Checks the snapshot for errors and loading states.
  static Widget? _checkSnapshot(
    AsyncSnapshot<AnnotatedResponses> snapshot, {
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
  }) {
    Widget? widget;

    if (snapshot.hasError) {
      widget = onError != null
          ? onError(snapshot.error!)
          : Text('${snapshot.error}');
    }

    if (!snapshot.hasData) {
      widget =
          onLoading != null ? onLoading() : const CircularProgressIndicator();
    }

    return widget;
  }

  /// Gets the list of [Feature] for the specified [AnnotationType].
  static List<Feature> _getFeatures(
          AnnotationType annotationType, int maxResults) =>
      [
        Feature(
          maxResults: maxResults,
          type: annotationType,
        )
      ];

  /// Builds the widget.
  @override
  Widget build(BuildContext context) =>
      FutureBuilder<(GoogleVision, ImageDetail)>(
          future: waitConcurrently<GoogleVision, ImageDetail>(googleVision,
              imageProvider.getImageDetails(format: ImageByteFormat.png)),
          builder: (BuildContext context,
              AsyncSnapshot<(GoogleVision, ImageDetail)> snapshot) {
            GoogleVision? googleVision;

            ImageDetail? imageDetail;

            if (snapshot.hasError) {
              return onError != null
                  ? onError!(snapshot.error!)
                  : Text(snapshot.error.toString());
            }

            if (snapshot.hasData) {
              googleVision = snapshot.data!.$1;

              imageDetail = snapshot.data!.$2;

              return FutureBuilder<AnnotatedResponses>(
                future: googleVision.annotate(
                    requests: AnnotationRequests(requests: [
                  AnnotationRequest(
                      jsonImage: JsonImage(byteBuffer: imageDetail.byteBuffer),
                      features: features)
                ])),
                builder: (BuildContext context,
                        AsyncSnapshot<AnnotatedResponses> snapshot) =>
                    builder(
                  context,
                  snapshot,
                  imageDetail!,
                ),
              );
            }

            return onLoading != null
                ? onLoading!()
                : const CircularProgressIndicator();
          });
}
