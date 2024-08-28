import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide GoogleVision, JsonImage, InputConfig;

/// A widget that builds a [GoogleVision] instance.
@Deprecated('Use GoogleVisionBuilder instead.')
class GoogleVisionBuilder extends GoogleVisionBuilderBase {
  /// The [ImageProvider] to be used for the image annotation.
  final ImageProvider imageProvider;

  /// The builder for the [GoogleVisionBuilder].
  final Widget Function(
    BuildContext,
    AsyncSnapshot<AnnotatedResponses>,
  ) builder;

  /// Creates a new instance of [GoogleVisionBuilder].
  GoogleVisionBuilder({
    super.key,
    required super.googleVision,
    required this.imageProvider,
    required super.features,
    required this.builder,
    super.onError,
    super.onLoading,
    int maxResults = 10,
  });

  /// Creates a new instance of [GoogleVisionBuilder] for crop hint detections.
  factory GoogleVisionBuilder.cropHints({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      CropHintsAnnotation?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.cropHintsAnnotation,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.cropHints, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for document text detections.
  factory GoogleVisionBuilder.documentTextDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      FullTextAnnotation?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.fullTextAnnotation,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.documentTextDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for face detections.
  factory GoogleVisionBuilder.faceDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      List<FaceAnnotation>?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.faceAnnotations,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.faceDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for image properties detection.
  factory GoogleVisionBuilder.imageProperties({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      ImagePropertiesAnnotation?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.imagePropertiesAnnotation,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.imageProperties, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for label detections.
  factory GoogleVisionBuilder.labelDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      List<EntityAnnotation>?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.labelAnnotations,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.labelDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for landmark detections.
  factory GoogleVisionBuilder.landmarkDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      List<EntityAnnotation>?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.landmarkAnnotations,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.landmarkDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for logo detections.
  factory GoogleVisionBuilder.logoDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      List<EntityAnnotation>?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.logoAnnotations,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.logoDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for object localization detections.
  factory GoogleVisionBuilder.objectLocalization({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      List<LocalizedObjectAnnotation>?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.localizedObjectAnnotations,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.objectLocalization, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for product search detections.
  factory GoogleVisionBuilder.productSearch({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      ProductSearchResults?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.productSearchResults,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.productSearch, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for safe search detections.
  factory GoogleVisionBuilder.safeSearchDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      SafeSearchAnnotation?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.safeSearchAnnotation,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.safeSearchDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for text detections.
  factory GoogleVisionBuilder.textDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      List<EntityAnnotation>?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.textAnnotations,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.textDetection, maxResults),
      );

  /// Creates a new instance of [GoogleVisionBuilder] for web detections.
  factory GoogleVisionBuilder.webDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
      BuildContext,
      WebDetection?,
    ) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (
          context,
          snapshot,
        ) =>
            builder(
          context,
          snapshot.data?.responses.first.webDetection,
        ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.webDetection, maxResults),
      );

  /// Builds the widget.
  @override
  Widget build(BuildContext context) {
    final googleVisionFutureResolver = GoogleVisionFutureResolver(
      googleVisionFuture: googleVision,
      imageProvider: imageProvider,
    );

    return FutureBuilder<AnnotatedResponses>(
      future: googleVisionFutureResolver.resolve(
        (byteBuffer) => AnnotationRequests(
          requests: [
            AnnotationRequest(
              jsonImage: gv.JsonImage(byteBuffer: byteBuffer),
              features: features,
            )
          ],
        ),
      ),
      builder: (
        context,
        snapshot,
      ) {
        Widget? widget = onLoading == null
            ? const Center(child: CircularProgressIndicator())
            : onLoading!();

        if (snapshot.hasData) {
          widget = builder(
            context,
            snapshot,
          );
        } else if (snapshot.hasError) {
          widget = onError == null
              ? onError!(snapshot.error!)
              : Center(child: Text('${snapshot.error}'));
        }

        return widget;
      },
    );
  }
}
