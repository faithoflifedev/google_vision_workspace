import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class MultipleDetections extends StatefulWidget {
  const MultipleDetections({super.key, required this.title});

  final String title;

  @override
  State<MultipleDetections> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MultipleDetections> {
  final _processImage = Image.asset(
    'assets/young-man-smiling.jpg', // 'assets/logo.png', // 'assets/young-man-smiling.jpg'
    fit: BoxFit.fitWidth,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('assets/young-man-smiling'),
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
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    features: [
                      Feature(
                        maxResults: 10,
                        type: AnnotationType
                            .faceDetection, // 'LOGO_DETECTION', // 'FACE_DETECTION'
                      ),
                      Feature(
                        maxResults: 10,
                        type: AnnotationType
                            .objectLocalization, // 'LOGO_DETECTION', // 'FACE_DETECTION'
                      ),
                    ],
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<AnnotatedResponses> snapshot,
                      ImageDetail? imageDetail,
                    ) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.hasData) {
                        return CustomPaint(
                          foregroundPainter: AnnotationPainter(
                            annotatedResponses: snapshot.data!,
                            imageDetail: imageDetail!,
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
      );
}

class AnnotationPainter extends CustomPainter {
  final AnnotatedResponses annotatedResponses;

  // a reference to the original image
  final ImageDetail imageDetail;

  AnnotationPainter({
    required this.annotatedResponses,
    required this.imageDetail,
  });

  // since the displayed image may be a different size than the original image,
  // we need to adjust the offset to the size of the displayed image
  // [imageDetail] holds the size of the original image
  double _heightModifier(Size size) => size.height / imageDetail.height;

  double _widthModifier(Size size) => size.width / imageDetail.width;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final heightRatio = _heightModifier(size);

    final widthRatio = _widthModifier(size);

    // face detection
    for (var faceAnnotation
        in annotatedResponses.responses.first.faceAnnotations) {
      drawAnnotationsRect(
        vertices: faceAnnotation.boundingPoly.vertices,
        canvas: canvas,
        heightRatio: heightRatio,
        widthRatio: widthRatio,
      );

      drawString(
        text: 'Face - ${(faceAnnotation.detectionConfidence * 100).toInt()}%',
        offset: faceAnnotation.boundingPoly.vertices.first.toResizedOffset(
          heightRatio: heightRatio,
          widthRatio: widthRatio,
        ),
        canvas: canvas,
        size: size,
      );
    }

    // landmark detection
    for (var landmarkAnnotation
        in annotatedResponses.responses.first.landmarkAnnotations) {
      drawAnnotationsRect(
        vertices: landmarkAnnotation.boundingPoly!.vertices,
        canvas: canvas,
        heightRatio: heightRatio,
        widthRatio: widthRatio,
      );

      drawString(
        text: 'Landmark - ${(landmarkAnnotation.score! * 100).toInt()}%',
        offset: landmarkAnnotation.boundingPoly!.vertices.first.toResizedOffset(
          heightRatio: heightRatio,
          widthRatio: widthRatio,
        ),
        canvas: canvas,
        size: size,
      );
    }

    // object localization
    for (var localizedObjectAnnotation
        in annotatedResponses.responses.first.localizedObjectAnnotations) {
      drawAnnotationsNormalized(
          vertices: localizedObjectAnnotation.boundingPoly!.normalizedVertices,
          canvas: canvas,
          size: size);

      drawString(
          text:
              '${localizedObjectAnnotation.name} - ${(localizedObjectAnnotation.score! * 100).toInt()}%',
          offset: localizedObjectAnnotation
              .boundingPoly!.normalizedVertices.first
              .toResizedOffset(size),
          canvas: canvas,
          size: size);
    }

    // logo detection
    for (var logoAnnotation
        in annotatedResponses.responses.first.logoAnnotations) {
      drawAnnotationsRect(
        vertices: logoAnnotation.boundingPoly!.vertices,
        canvas: canvas,
        heightRatio: heightRatio,
        widthRatio: widthRatio,
      );

      drawString(
        text:
            '${logoAnnotation.description} - ${(logoAnnotation.score! * 100).toInt()}%',
        offset: logoAnnotation.boundingPoly!.vertices.first.toResizedOffset(
          heightRatio: heightRatio,
          widthRatio: widthRatio,
        ),
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
    required double heightRatio,
    required double widthRatio,
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
        vertices.first.toResizedOffset(
          heightRatio: heightRatio,
          widthRatio: widthRatio,
        ),
        vertices[2].toResizedOffset(
          heightRatio: heightRatio,
          widthRatio: widthRatio,
        ),
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
