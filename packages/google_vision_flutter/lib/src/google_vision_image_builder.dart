import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_converter/flutter_image_converter.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

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
  const GoogleVisionImageBuilder({
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
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.cropHints,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for document text detections.
  factory GoogleVisionImageBuilder.documentTextDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.documentTextDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for face detections.
  factory GoogleVisionImageBuilder.faceDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.faceDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for image properties detection.
  factory GoogleVisionImageBuilder.imageProperties({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.imageProperties,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for label detections.
  factory GoogleVisionImageBuilder.labelDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.labelDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for landmark detections.
  factory GoogleVisionImageBuilder.landmarkDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.landmarkDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for logo detections.
  factory GoogleVisionImageBuilder.logoDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.logoDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for object localization detections.
  factory GoogleVisionImageBuilder.objectLocalization({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.objectLocalization,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for product search detections.
  factory GoogleVisionImageBuilder.productSearch({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.productSearch,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for safe search detections.
  factory GoogleVisionImageBuilder.safeSearchDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.safeSearchDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for text detections.
  factory GoogleVisionImageBuilder.textDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.textDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for web detections.
  factory GoogleVisionImageBuilder.webDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
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
          AnnotationType.webDetection,
          maxResults,
        ),
        onError: onError,
        onLoading: onLoading,
      );

  Future<BatchAnnotateImagesResponse> _batchAnnotateImagesResponse() async {
    final googleVision = await this.googleVision;

    final byteData = await imageProvider.pngByteData;

    return googleVision.image.annotate(
      requests: [
        AnnotateImageRequest(
          jsonImage: JsonImage(byteBuffer: byteData.buffer),
          features: features,
        )
      ],
      parent: parent,
    );
  }

  /// Builds the widget.
  @override
  Widget build(BuildContext context) => getBuild<BatchAnnotateImagesResponse>(
        context,
        _batchAnnotateImagesResponse(),
        builder,
      );
}
