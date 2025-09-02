import 'package:flutter/material.dart';
import 'package:google_vision_flutter/extensions/vertex.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class MultipleFaceDetectionPage extends ExampleBase {
  static const assetName1 = 'assets/young-man-smiling.jpg';

  static const assetName2 = 'assets/dj.jpg';

  final _processImage1 = Image.asset(
    assetName1,
    fit: BoxFit.fitWidth,
    height: 300,
  );

  final _processImage2 = Image.asset(
    assetName2,
    fit: BoxFit.fitWidth,
    height: 300,
  );

  MultipleFaceDetectionPage({
    super.key,
    required super.googleVision,
    required super.title,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(assetName1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _processImage1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(assetName2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _processImage2,
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Processed images will appear below:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoogleVisionImageBuilder.faceDetection(
                  googleVision: googleVision,
                  imageProvider: _processImage1.image,
                  builder:
                      (
                        BuildContext context,
                        List<FaceAnnotation>? faceAnnotations,
                      ) => CustomPaint(
                        foregroundPainter: AnnotationPainter(
                          faceAnnotations: faceAnnotations,
                        ),
                        child: Image(image: _processImage1.image),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoogleVisionImageBuilder.faceDetection(
                  googleVision: googleVision,
                  imageProvider: _processImage2.image,
                  builder:
                      (
                        BuildContext context,
                        List<FaceAnnotation>? faceAnnotations,
                      ) => CustomPaint(
                        foregroundPainter: AnnotationPainter(
                          faceAnnotations: faceAnnotations,
                        ),
                        child: Image(image: _processImage2.image),
                      ),
                ),
              ),
            ],
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
