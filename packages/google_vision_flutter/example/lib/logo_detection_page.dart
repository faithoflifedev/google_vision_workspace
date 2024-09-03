import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class LogoDetectionPage extends ExampleBase {
  static const assetName = 'assets/google_logo.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  LogoDetectionPage({
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
              result: GoogleVisionBuilder.logoDetection(
                googleVision: googleVision,
                imageProvider: _processImage.image,
                builder: (
                  BuildContext context,
                  List<EntityAnnotation>? entityAnnotations,
                ) =>
                    CustomPaint(
                  foregroundPainter: EntityAnnotationPainter(
                    entityAnnotations: entityAnnotations,
                  ),
                  child: Image(image: _processImage.image),
                ),
              ),
            )),
      );
}

class EntityAnnotationPainter extends CustomPainter {
  final List<EntityAnnotation>? entityAnnotations;

  EntityAnnotationPainter({
    required this.entityAnnotations,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    // logo detection
    for (var entityAnnotation in entityAnnotations!) {
      drawAnnotationsRect(
        vertices: entityAnnotation.boundingPoly!.vertices,
        canvas: canvas,
      );

      drawString(
        text: 'Logo - ${(entityAnnotation.score! * 100).toInt()}%',
        offset: entityAnnotation.boundingPoly!.vertices.first.toOffset(),
        canvas: canvas,
        size: size,
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

  void drawAnnotationsRect({
    required List<Vertex> vertices,
    required Canvas canvas,
    Color? color,
    double strokeWidth = 1,
  }) {
    color ??= Colors.red.shade400;

    final paint = Paint();

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    paint.color = color;

    canvas.drawRect(
      Rect.fromPoints(
        vertices.first.toOffset(),
        vertices[2].toOffset(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
