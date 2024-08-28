import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class TextDetection extends StatefulWidget {
  const TextDetection({super.key, required this.title});

  final String title;

  @override
  State<TextDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TextDetection> {
  final _processImage = Image.asset(
    'assets/setagaya_small.jpg',
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('assets/setagaya_small.jpg'),
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
                    child: GoogleVisionBuilder.textDetection(
                      googleVision: GoogleVision.withAsset(
                          'assets/service_credentials.json'),
                      imageProvider: _processImage.image,
                      builder: (
                        BuildContext context,
                        List<EntityAnnotation>? entityAnnotations,
                      ) {
                        return CustomPaint(
                          foregroundPainter: AnnotationPainter(
                              entityAnnotations: entityAnnotations),
                          child: Image(image: _processImage.image),
                        );
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
