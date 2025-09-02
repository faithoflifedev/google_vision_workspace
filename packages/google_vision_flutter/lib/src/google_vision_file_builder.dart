import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

/// A widget that builds a [GoogleVisionFileBuilder] instance.
class GoogleVisionFileBuilder extends GoogleVisionBuilderBase {
  /// The [InputConfig] to be used for the image annotation.
  final Future<InputConfig> inputConfig;

  /// The builder for the [GoogleVisionFileBuilder].
  final Widget Function(
    BuildContext context,
    AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
  )
  builder;

  /// Creates a new instance of [GoogleVisionFileBuilder].
  const GoogleVisionFileBuilder({
    super.key,
    required super.googleVision,
    required this.inputConfig,
    required super.features,
    required this.builder,
    super.onError,
    super.onLoading,
    super.parent,
    int maxResults = 10,
  });

  /// Creates a new instance of [GoogleVisionFileBuilder] for crop hint detections.
  factory GoogleVisionFileBuilder.cropHints({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.cropHints,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for document text detections.
  factory GoogleVisionFileBuilder.documentTextDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.documentTextDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for face detections.
  factory GoogleVisionFileBuilder.faceDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.faceDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for image properties detection.
  factory GoogleVisionFileBuilder.imageProperties({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.imageProperties,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for label detections.
  factory GoogleVisionFileBuilder.labelDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.labelDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for landmark detections.
  factory GoogleVisionFileBuilder.landmarkDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.landmarkDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for logo detections.
  factory GoogleVisionFileBuilder.logoDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.logoDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for object localization detections.
  factory GoogleVisionFileBuilder.objectLocalization({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.objectLocalization,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for product search detections.
  factory GoogleVisionFileBuilder.productSearch({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.productSearch,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for safe search detections.
  factory GoogleVisionFileBuilder.safeSearchDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.safeSearchDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for text detections.
  factory GoogleVisionFileBuilder.textDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.textDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  /// Creates a new instance of [GoogleVisionFileBuilder] for web detections.
  factory GoogleVisionFileBuilder.webDetection({
    Key? key,
    required FutureOr<GoogleVision> googleVision,
    required Future<InputConfig> inputConfig,
    required Widget Function(BuildContext, List<AnnotateFileResponse>?) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) => GoogleVisionFileBuilder(
    builder:
        (
          BuildContext context,
          AsyncSnapshot<BatchAnnotateFilesResponse> snapshot,
        ) => builder(context, snapshot.data?.responses),
    inputConfig: inputConfig,
    googleVision: googleVision,
    features: GoogleVisionBuilderBase.getFeatures(
      AnnotationType.webDetection,
      maxResults,
    ),
    onError: onError,
    onLoading: onLoading,
  );

  Future<BatchAnnotateFilesResponse> _batchAnnotateFilesResponse() async {
    final googleVision = await this.googleVision;

    final inputConfig = await this.inputConfig;

    return googleVision.file.annotate(
      requests: [
        AnnotateFileRequest(inputConfig: inputConfig, features: features),
      ],
      parent: parent,
    );
  }

  /// Builds the widget.
  @override
  Widget build(BuildContext context) => getBuild<BatchAnnotateFilesResponse>(
    context,
    _batchAnnotateFilesResponse(),
    builder,
  );
}
