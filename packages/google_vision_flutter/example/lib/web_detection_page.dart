import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class WebDetectionPage extends ExampleBase {
  static const assetName = 'assets/structures.png';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
    height: 600.0,
  );

  WebDetectionPage({
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
        result: GoogleVisionImageBuilder.webDetection(
          googleVision: googleVision,
          imageProvider: _processImage.image,
          builder: (BuildContext context, WebDetection? webDetection) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:
                      webDetection?.webEntities
                          ?.map(
                            (e) => Center(
                              child: Text('${e.score} - ${e.description}'),
                            ),
                          )
                          .toList() ??
                      const <Widget>[],
                ),
              ),
        ),
      ),
    ),
  );
}
