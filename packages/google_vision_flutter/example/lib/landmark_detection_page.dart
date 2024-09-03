import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class LandmarkDetectionPage extends ExampleBase {
  static const assetName = 'assets/cn_tower.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  LandmarkDetectionPage({
    super.key,
    required super.googleVision,
    required super.title,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            appBar: getAppBar(context),
            body: simpleColumn(
              assetName: assetName,
              sampleImage: _processImage,
              result: GoogleVisionBuilder.landmarkDetection(
                googleVision: googleVision,
                imageProvider: _processImage.image,
                builder: (
                  BuildContext context,
                  List<EntityAnnotation>? entityAnnotations,
                ) =>
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: entityAnnotations!
                          .map(
                            (landmark) => Text(
                                '${landmark.score} - ${landmark.description}'),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            )),
      );
}
