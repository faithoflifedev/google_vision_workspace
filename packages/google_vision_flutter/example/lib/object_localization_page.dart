import 'package:flutter/material.dart';
import 'package:google_vision_flutter/extensions/vertex.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class ObjectLocalizationPage extends ExampleBase {
  static const assetName = 'assets/young-man-smiling.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
    width: 300.0,
  );

  ObjectLocalizationPage({
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
            result: GoogleVisionImageBuilder.objectLocalization(
              googleVision: googleVision,
              imageProvider: _processImage.image,
              builder: (
                BuildContext context,
                List<LocalizedObjectAnnotation>? localizedObjectAnnotations,
              ) =>
                  CustomPaint(
                foregroundPainter: AnnotationPainter(
                  localizedObjectAnnotations: localizedObjectAnnotations,
                  uiImage: _processImage,
                ),
                child: Image(image: _processImage.image),
              ),
            ),
          ),
        ),
      );
}

class AnnotationPainter extends CustomPainter {
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotations;
  // a reference to the original image
  final Image uiImage;

  AnnotationPainter({
    required this.localizedObjectAnnotations,
    required this.uiImage,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var yOffset = 0.0;

    // object localization
    for (var localizedObjectAnnotation in localizedObjectAnnotations!) {
      drawAnnotationsNormalized(
          vertices: localizedObjectAnnotation.boundingPoly!.normalizedVertices,
          canvas: canvas,
          size: size);

      drawString(
          text:
              '${localizedObjectAnnotation.name} - ${(localizedObjectAnnotation.score! * 100).toInt()}%',
          offset: localizedObjectAnnotation
                  .boundingPoly!.normalizedVertices.first
                  .toResizedOffset(size) +
              Offset(0, yOffset),
          canvas: canvas,
          size: size);

      yOffset += 12.0;
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

  void drawAnnotationsNormalized({
    required List<NormalizedVertex> vertices,
    required Canvas canvas,
    required Size size,
    Color? color,
    double strokeWidth = 1,
  }) {
    final paint = Paint();

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    paint.color = Colors.red;

    canvas.drawRect(
      Rect.fromPoints(
        vertices[1].toResizedOffset(size),
        vertices.last.toResizedOffset(size),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
