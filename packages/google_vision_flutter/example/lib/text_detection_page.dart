import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'package:vision_demo/example_base.dart';

class TextDetectionPage extends ExampleBase {
  static const assetName = 'assets/setagaya_small.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  TextDetectionPage({
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
            result: GoogleVisionBuilder.textDetection(
              googleVision: googleVision,
              imageProvider: _processImage.image,
              builder: (
                BuildContext context,
                List<EntityAnnotation>? entityAnnotations,
              ) =>
                  CustomPaint(
                foregroundPainter:
                    AnnotationPainter(entityAnnotations: entityAnnotations),
                child: _processImage,
              ),
            ),
          ),
        ),
      );
}

class AnnotationPainter extends CustomPainter {
  final List<EntityAnnotation>? entityAnnotations;

  AnnotationPainter({
    required this.entityAnnotations,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    for (var entityAnnotation in entityAnnotations!) {
      drawString(
        text: entityAnnotation.description,
        offset: entityAnnotation.boundingPoly!.vertices.first.toOffset(),
        canvas: canvas,
        size: size,
        color: Colors.blueAccent.shade100,
      );
    }
  }

  void drawString({
    required String text,
    required Offset offset,
    required Canvas canvas,
    required Size size,
    Color? color,
  }) {
    color ??= Colors.red.shade900;

    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color),
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    tp.layout();

    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
