import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class ObjectLocalization extends StatefulWidget {
  const ObjectLocalization({super.key, required this.title});

  final String title;

  @override
  State<ObjectLocalization> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ObjectLocalization> {
  final _processImage = Image.asset(
    'assets/young-man-smiling.jpg',
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
                  child: GoogleVisionBuilder.objectLocalization(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (BuildContext context,
                        List<LocalizedObjectAnnotation>?
                            localizedObjectAnnotations,
                        ImageDetail imageDetail) {
                      return CustomPaint(
                        foregroundPainter: AnnotationPainter(
                          localizedObjectAnnotations:
                              localizedObjectAnnotations,
                          imageDetail: imageDetail,
                        ),
                        child: Image(image: _processImage.image),
                      );
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
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotations;
  // a reference to the original image
  final ImageDetail imageDetail;

  AnnotationPainter({
    required this.localizedObjectAnnotations,
    required this.imageDetail,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
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
              .toResizedOffset(size),
          canvas: canvas,
          size: size);
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
