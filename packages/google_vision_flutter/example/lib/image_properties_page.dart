import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class ImagePropertiesPage extends ExampleBase {
  static const assetName = 'assets/google_logo.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  ImagePropertiesPage({
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
            result: GoogleVisionImageBuilder.imageProperties(
              maxResults: 5,
              googleVision: googleVision,
              imageProvider: _processImage.image,
              builder: (
                BuildContext context,
                ImagePropertiesAnnotation? imagePropertiesAnnotation,
              ) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const Text('Dominant Colors:'),
                  ...imagePropertiesAnnotation!.dominantColors.colors
                      .map((colors) => Text('$colors',
                          style: TextStyle(
                            color: Color.fromRGBO(
                              colors.color.red.toInt(),
                              colors.color.green.toInt(),
                              colors.color.blue.toInt(),
                              1.0,
                            ),
                          )))
                ]),
              ),
            ),
          ),
        ),
      );
}
