import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide GoogleVision;

class GoogleVisionBuilder extends StatelessWidget {
  final Future<GoogleVision> googleVision;

  final ImageProvider imageProvider;

  final List<Feature> features;

  final Widget Function(
    BuildContext context,
    AsyncSnapshot<AnnotatedResponses> snapshot,
    ImageDetail imageDetail,
  ) builder;

  final Widget Function(Object error)? onError;

  final Widget Function()? onLoading;

  const GoogleVisionBuilder({
    super.key,
    required this.googleVision,
    required this.imageProvider,
    required this.features,
    required this.builder,
    this.onError,
    this.onLoading,
  });

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
