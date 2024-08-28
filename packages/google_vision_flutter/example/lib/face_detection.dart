import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class FaceDetection extends StatefulWidget {
  const FaceDetection({super.key, required this.title});

  final String title;

  @override
  State<FaceDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FaceDetection> {
  final _processImage = Image.asset(
    'assets/young-man-smiling.jpg',
    fit: BoxFit.fitWidth,
    width: 300,
  );

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.title),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('assets/young-man-smiling.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _processImage,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Processed image will appear below:',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GoogleVisionBuilder.faceDetection(
                      googleVision: GoogleVision.withAsset(
                          'assets/service_credentials.json'),
                      imageProvider: _processImage.image,
                      builder: (
                        BuildContext context,
                        List<FaceAnnotation>? faceAnnotations,
                      ) =>
                          CustomPaint(
                        foregroundPainter: AnnotationPainter(
                          faceAnnotations: faceAnnotations,
                        ),
                        child: Image(image: _processImage.image),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

class AnnotationPainter extends CustomPainter {
  final List<FaceAnnotation>? faceAnnotations;

  AnnotationPainter({
    required this.faceAnnotations,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
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
