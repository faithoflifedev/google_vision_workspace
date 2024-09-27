import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class LabelDetectionPage extends ExampleBase {
  static const assetName = 'assets/setagaya_small.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  LabelDetectionPage({
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
            result: GoogleVisionImageBuilder.labelDetection(
              googleVision: googleVision,
              imageProvider: _processImage.image,
              builder: (
                BuildContext context,
                List<EntityAnnotation>? entityAnnotations,
              ) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: entityAnnotations!
                        .map((entity) => Text(
                            '${(entity.score! * 100).toStringAsFixed(2)}% - ${entity.description}'))
                        .toList()),
              ),
            ),
          ),
        ),
      );
}
