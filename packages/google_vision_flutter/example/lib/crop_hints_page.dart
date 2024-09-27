import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class CropHintsPage extends ExampleBase {
  static const assetName = 'assets/young-man-smiling.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
    width: 300,
  );

  CropHintsPage({
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
              result: GoogleVisionImageBuilder.cropHints(
                googleVision: googleVision,
                imageProvider: _processImage.image,
                builder: (
                  BuildContext context,
                  CropHintsAnnotation? cropHintsAnnotation,
                ) =>
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: cropHintsAnnotation!.cropHints
                          .map((cropHint) => Center(
                                child: Text('$cropHint'),
                              ))
                          .toList()),
                ),
              )),
        ),
      );
}
