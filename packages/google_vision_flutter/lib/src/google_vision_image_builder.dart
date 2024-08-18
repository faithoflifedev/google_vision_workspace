import 'dart:ui';

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
    ImageDetail imageDetail,
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
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, CropHintsAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.cropHints, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for document text detections.
  factory GoogleVisionImageBuilder.documentTextDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, FullTextAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.documentTextDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for face detections.
  factory GoogleVisionImageBuilder.faceDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<FaceAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.faceDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for image properties detection.
  factory GoogleVisionImageBuilder.imageProperties({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
            BuildContext, ImagePropertiesAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.imageProperties, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for label detections.
  factory GoogleVisionImageBuilder.labelDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.labelDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for landmark detections.
  factory GoogleVisionImageBuilder.landmarkDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.landmarkDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for logo detections.
  factory GoogleVisionImageBuilder.logoDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.logoDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for object localization detections.
  factory GoogleVisionImageBuilder.objectLocalization({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
            BuildContext, List<LocalizedObjectAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.objectLocalization, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for product search detections.
  factory GoogleVisionImageBuilder.productSearch({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, ProductSearchResults?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.productSearch, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for safe search detections.
  factory GoogleVisionImageBuilder.safeSearchDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, SafeSearchAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.safeSearchDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for text detections.
  factory GoogleVisionImageBuilder.textDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.textDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionImageBuilder] for web detections.
  factory GoogleVisionImageBuilder.webDetection({
    Key? key,
    required Future<gv.GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, WebDetection?, ImageDetail) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionImageBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<BatchAnnotateImagesResponse> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
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
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.webDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Builds the widget.
  @override
  Widget build(BuildContext context) =>
      FutureBuilder<(gv.GoogleVision, ImageDetail)>(
        future: waitConcurrently<gv.GoogleVision, ImageDetail>(
          googleVision,
          imageProvider.getImageDetails(format: ImageByteFormat.png),
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<(gv.GoogleVision, ImageDetail)> snapshot,
        ) {
          gv.GoogleVision? googleVision;

          ImageDetail? imageDetail;

          if (snapshot.hasError) {
            return onError != null
                ? onError!(snapshot.error!)
                : Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            googleVision = snapshot.data!.$1;

            imageDetail = snapshot.data!.$2;

            return FutureBuilder<BatchAnnotateImagesResponse>(
              future: googleVision.image.annotate(requests: [
                AnnotateImageRequest(
                    jsonImage: gv.JsonImage(byteBuffer: imageDetail.byteBuffer),
                    features: features)
              ]),
              builder: (BuildContext context,
                      AsyncSnapshot<BatchAnnotateImagesResponse> snapshot) =>
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
        },
      );
}
