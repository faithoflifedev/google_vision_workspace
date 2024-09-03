import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class DocumentTextDetectionPage extends ExampleBase {
  static const assetName = 'assets/census2010.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );
  DocumentTextDetectionPage({
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
            result: GoogleVisionBuilder.documentTextDetection(
              googleVision: googleVision,
              imageProvider: _processImage.image,
              builder: (
                BuildContext context,
                FullTextAnnotation? fullTextAnnotation,
              ) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: fullTextAnnotation!.pages
                        .map((page) => Center(
                              child: Text(
                                'Page Language - ${page.property?.detectedLanguages?.first.languageCode ?? ''}',
                              ),
                            ))
                        .toList()),
              ),
            ),
          ),
        ),
      );
}
