import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

abstract class GoogleVisionBuilderBase extends StatelessWidget {
  final FutureOr<gv.GoogleVision> googleVision;

  /// The error builder for the [GoogleVisionFileBuilder].
  final Widget Function(Object error)? onError;

  /// The loading builder for the [GoogleVisionFileBuilder].
  final Widget Function()? onLoading;

  /// The list of [Feature] to be used for the image annotation.
  final List<Feature> features;

  /// Optional. Target project and location to make a call.
  ///
  /// Format: projects/{project-id}/locations/{location-id}.
  ///
  /// If no parent is specified, a region will be chosen automatically.
  ///
  /// Supported location-ids: us: USA country only, eu: The European Union.
  ///
  /// Example: projects/project-A/locations/eu.
  final String? parent;

  /// Creates a new instance of [GoogleVisionBuilderBase].
  const GoogleVisionBuilderBase({
    super.key,
    this.onError,
    this.onLoading,
    required this.googleVision,
    required this.features,
    this.parent,
  });

  /// Gets the list of [Feature] for the specified [AnnotationType].
  static List<Feature> getFeatures(
          AnnotationType annotationType, int maxResults) =>
      [
        Feature(
          maxResults: maxResults,
          type: annotationType,
        )
      ];

  Widget getBuild<T>(
    BuildContext context,
    Future<T> future,
    Widget Function(
      BuildContext context,
      AsyncSnapshot<T> snapshot,
    ) builder,
  ) =>
      FutureBuilder<T>(
        future: future,
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
                ? Center(child: Text('${snapshot.error}'))
                : onError!(snapshot.error!);
          }

          return widget;
        },
      );
}
