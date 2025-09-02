import 'package:flutter/material.dart';
import 'package:google_vision_flutter/extensions/vertex.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class FaceDetectionPage extends ExampleBase {
  static const assetName = 'assets/young-man-smiling.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
    width: 300,
  );

  FaceDetectionPage({
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
        result: GoogleVisionImageBuilder.faceDetection(
          googleVision: googleVision,
          imageProvider: _processImage.image,
          builder:
              (BuildContext context, List<FaceAnnotation>? faceAnnotations) =>
                  CustomPaint(
                    foregroundPainter: AnnotationPainter(
                      faceAnnotations: faceAnnotations,
                    ),
                    child: Image(image: _processImage.image),
                  ),
        ),
      ),
    ),
  );
}

class AnnotationPainter extends CustomPainter {
  final List<FaceAnnotation>? faceAnnotations;

  AnnotationPainter({required this.faceAnnotations});

  @override
  void paint(Canvas canvas, Size size) {
    // face detection
    for (var faceAnnotation in faceAnnotations!) {
      drawAnnotationsRect(
        vertices: faceAnnotation.boundingPoly.vertices,
        canvas: canvas,
      );

      drawString(
        text: 'Face - ${(faceAnnotation.detectionConfidence * 100).toInt()}%',
        offset: faceAnnotation.boundingPoly.vertices.first.toOffset(),
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
      Rect.fromPoints(vertices.first.toOffset(), vertices[2].toOffset()),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
