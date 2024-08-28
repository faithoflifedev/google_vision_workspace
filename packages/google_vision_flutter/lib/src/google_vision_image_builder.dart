import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide GoogleVision, JsonImage;

/// A widget that builds a [GoogleVision] instance.
class GoogleVisionImageBuilder extends GoogleVisionBuilderBase {
  /// The [ImageProvider] to be used for the image annotation.
  final ImageProvider imageProvider;

  /// The builder for the [GoogleVisionImageBuilder].
  final Widget Function(
    BuildContext context,
    AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
  ) builder;

  /// Creates a new instance of [GoogleVisionImageBuilder].
  GoogleVisionImageBuilder({
    super.key,
    required super.googleVision,
    required this.imageProvider,
    required super.features,
    required this.builder,
    super.onError,
    super.onLoading,
    int maxResults = 10,
  });

  /// Creates a new instance of [GoogleVisionImageBuilder] for crop hint detections.
  factory GoogleVisionImageBuilder.cropHints({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for document text detections.
  factory GoogleVisionImageBuilder.documentTextDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for face detections.
  factory GoogleVisionImageBuilder.faceDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for image properties detection.
  factory GoogleVisionImageBuilder.imageProperties({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for label detections.
  factory GoogleVisionImageBuilder.labelDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for landmark detections.
  factory GoogleVisionImageBuilder.landmarkDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for logo detections.
  factory GoogleVisionImageBuilder.logoDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for object localization detections.
  factory GoogleVisionImageBuilder.objectLocalization({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for product search detections.
  factory GoogleVisionImageBuilder.productSearch({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for safe search detections.
  factory GoogleVisionImageBuilder.safeSearchDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for text detections.
  factory GoogleVisionImageBuilder.textDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

  /// Creates a new instance of [GoogleVisionImageBuilder] for web detections.
  factory GoogleVisionImageBuilder.webDetection({
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
      GoogleVisionImageBuilder(
        builder: (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
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

    return FutureBuilder<BatchAnnotateImagesResponse>(
      future: googleVisionFutureResolver.resolveImage((byteBuffer) => [
            AnnotateImageRequest(
                jsonImage: gv.JsonImage(byteBuffer: byteBuffer),
                features: features)
          ]),
      builder: (BuildContext context,
          AsyncSnapshot<BatchAnnotateImagesResponse> snapshot) {
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
