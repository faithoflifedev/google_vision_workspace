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

  /// Creates a new instance of [GoogleVisionBuilderBase].
  const GoogleVisionBuilderBase({
    super.key,
    this.onError,
    this.onLoading,
    required this.googleVision,
    required this.features,
  });

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

  /// Wait for two futures to complete concurrently.
  Future<(T1, T2)> waitForFuture<T1, T2>(
    Future<T1> future1,
    T2 result2,
  ) async {
    late T1 result1;

    future1.then((value) => result1 = value);

    return Future.value((result1, result2));
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

  /// Checks the snapshot for errors and loading states.
  static Widget? checkSnapshot(
    AsyncSnapshot snapshot, {
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
}
