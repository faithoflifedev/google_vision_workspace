import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

class LogoDetection extends StatefulWidget {
  const LogoDetection({super.key, required this.title});

  final String title;

  @override
  State<LogoDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LogoDetection> {
  final _processImage = Image.asset(
    'assets/logo.png',
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
                  child: Text('assets/logo.png'),
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
                  child: GoogleVisionBuilder.logoDetection(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (BuildContext context,
                        List<gv.EntityAnnotation>? entityAnnotations,
                        ImageDetail imageDetail) {
                      return CustomPaint(
                        foregroundPainter: EntityAnnotationPainter(
                          entityAnnotations: entityAnnotations,
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

class EntityAnnotationPainter extends CustomPainter {
  final List<gv.EntityAnnotation>? entityAnnotations;
  // a reference to the original image
  final ImageDetail imageDetail;

  EntityAnnotationPainter({
    required this.entityAnnotations,
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

    // logo detection
    for (var entityAnnotation in entityAnnotations!) {
      drawAnnotationsRect(
        vertices: entityAnnotation.boundingPoly!.vertices,
        canvas: canvas,
        heightRatio: heightRatio,
        widthRatio: widthRatio,
      );

      drawString(
        text: 'Logo - ${(entityAnnotation.score! * 100).toInt()}%',
        offset: entityAnnotation.boundingPoly!.vertices.first.toResizedOffset(
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
    required List<gv.Vertex> vertices,
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

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
