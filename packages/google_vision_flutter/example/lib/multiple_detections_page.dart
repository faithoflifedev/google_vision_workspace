import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class MultipleDetectionsPage extends ExampleBase {
  static const assetName = 'assets/young-man-smiling.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
    width: 300,
  );

  MultipleDetectionsPage({
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
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(assetName),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Operation: FACE_DETECTION and OBJECT_LOCALIZATION',
                      textAlign: TextAlign.center,
                    ),
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
                    child: GoogleVisionBuilder(
                      googleVision: googleVision,
                      imageProvider: _processImage.image,
                      features: [
                        Feature(
                          maxResults: 10,
                          type: AnnotationType.faceDetection,
                        ),
                        Feature(
                          maxResults: 10,
                          type: AnnotationType.objectLocalization,
                        ),
                      ],
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<AnnotatedResponses> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.hasData) {
                          return CustomPaint(
                            foregroundPainter: AnnotationPainter(
                              annotatedResponses: snapshot.data!,
                            ),
                            child: Image(image: _processImage.image),
                          );
                        }

                        return const Center(child: CircularProgressIndicator());
                      },
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
  final AnnotatedResponses annotatedResponses;

  AnnotationPainter({
    required this.annotatedResponses,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var faceOffset = Offset.zero;
    var landmarkOffset = Offset.zero;
    var objectOffset = Offset.zero;
    var logoOffset = Offset.zero;

    // face detection
    for (var faceAnnotation
        in annotatedResponses.responses.first.faceAnnotations) {
      drawAnnotationsRect(
        vertices: faceAnnotation.boundingPoly.vertices,
        canvas: canvas,
      );

      drawString(
        text: 'Face - ${(faceAnnotation.detectionConfidence * 100).toInt()}%',
        offset:
            faceAnnotation.boundingPoly.vertices.first.toOffset() + faceOffset,
        canvas: canvas,
        size: size,
      );

      faceOffset += const Offset(0, 10);
    }

    // landmark detection
    for (var landmarkAnnotation
        in annotatedResponses.responses.first.landmarkAnnotations) {
      drawAnnotationsRect(
        vertices: landmarkAnnotation.boundingPoly!.vertices,
        canvas: canvas,
      );

      drawString(
        text: 'Landmark - ${(landmarkAnnotation.score! * 100).toInt()}%',
        offset: landmarkAnnotation.boundingPoly!.vertices.first.toOffset() +
            landmarkOffset,
        canvas: canvas,
        size: size,
      );
      landmarkOffset += const Offset(0, 10);
    }

    // object localization
    for (var localizedObjectAnnotation
        in annotatedResponses.responses.first.localizedObjectAnnotations) {
      drawAnnotationsNormalized(
        vertices: localizedObjectAnnotation.boundingPoly!.normalizedVertices,
        canvas: canvas,
        size: size,
      );

      drawString(
          text:
              '${localizedObjectAnnotation.name} - ${(localizedObjectAnnotation.score! * 100).toInt()}%',
          offset: localizedObjectAnnotation
                  .boundingPoly!.normalizedVertices.first
                  .toResizedOffset(size) +
              objectOffset,
          canvas: canvas,
          size: size);

      objectOffset += const Offset(0, 10);
    }

    // logo detection
    for (var logoAnnotation
        in annotatedResponses.responses.first.logoAnnotations) {
      drawAnnotationsRect(
        vertices: logoAnnotation.boundingPoly!.vertices,
        canvas: canvas,
      );

      drawString(
        text:
            '${logoAnnotation.description} - ${(logoAnnotation.score! * 100).toInt()}%',
        offset:
            logoAnnotation.boundingPoly!.vertices.first.toOffset() + logoOffset,
        canvas: canvas,
        size: size,
      );

      logoOffset += const Offset(0, 10);
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
