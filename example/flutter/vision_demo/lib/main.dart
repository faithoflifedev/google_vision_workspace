import 'dart:io';

import 'package:flutter/material.dart' as mat show Image;
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Vision Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Google Vision Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _image = '';

  Future<String> getFileFromAsset(String assetFileName,
      {String? temporaryFileName}) async {
    final byteData = await rootBundle.load('assets/$assetFileName');

    final buffer = byteData.buffer;

    final fileName = temporaryFileName ?? assetFileName;

    final filePath = await getTempFile(fileName);

    await File(filePath).delete();

    await File(filePath).writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return filePath;
  }

  Future<String> getTempFile([String? fileName]) async {
    final tempDir = await getTemporaryDirectory();

    return '${tempDir.path}${Platform.pathSeparator}${fileName ?? UniqueKey().toString()}';
  }

  void drawHello(String outFile) async {
    final fontZipFile = await getFileFromAsset('arial_unicode.ttf.zip');

    final fontFile = await File(fontZipFile).readAsBytes();

    final font = img.BitmapFont.fromZip(fontFile);

    final image = img.Image(width: 320, height: 200);

    img.drawString(image, 'Hello',
        font: font, x: 10, y: 100, color: img.ColorInt8.rgb(0, 0, 0));

    // final testFile = await getTempFile();

    await img.encodePngFile(outFile, image);
  }

  void _processImage() async {
    final jwtFromAsset = await getFileFromAsset('service_credentials.json');

    final googleVision = await GoogleVision.withJwt(jwtFromAsset);

    final imageFile = await getFileFromAsset(
        'young-man-smiling-and-thumbs-up.jpg',
        temporaryFileName: 'young-man-smiling-and-thumbs-up.jpg');

    final image = Painter.fromFilePath(imageFile);

    final cropped = image.copyCrop(70, 30, 640, 480);

    final filePath = await getTempFile();

    await cropped.writeAsJpeg(filePath);

    final requests = AnnotationRequests(requests: [
      AnnotationRequest(image: Image(painter: image), features: [
        Feature(maxResults: 10, type: 'FACE_DETECTION'),
        Feature(maxResults: 10, type: 'OBJECT_LOCALIZATION')
      ])
    ]);

    final annotatedResponses = await googleVision.annotate(requests: requests);

    for (var annotatedResponse in annotatedResponses.responses) {
      for (var faceAnnotation in annotatedResponse.faceAnnotations) {
        GoogleVision.drawText(
            image,
            faceAnnotation.boundingPoly.vertices.first.x + 2,
            faceAnnotation.boundingPoly.vertices.first.y + 2,
            'Face - ${faceAnnotation.detectionConfidence}');

        GoogleVision.drawAnnotations(
            image, faceAnnotation.boundingPoly.vertices);
      }
    }

    for (var annotatedResponse in annotatedResponses.responses) {
      annotatedResponse.localizedObjectAnnotations
          .where((localizedObjectAnnotation) =>
              localizedObjectAnnotation.name == 'Person')
          .toList()
          .forEach((localizedObjectAnnotation) {
        GoogleVision.drawText(
            image,
            (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.x *
                    image.width)
                .toInt(),
            (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.y *
                        image.height)
                    .toInt() -
                16,
            'Person - ${localizedObjectAnnotation.score}');

        GoogleVision.drawAnnotationsNormalized(
            image, localizedObjectAnnotation.boundingPoly.normalizedVertices);
      });
    }

    drawHello(filePath);

    // await image.writeAsJpeg(filePath);

    setState(() {
      _image = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Processed image will appear below:',
            ),
            _image == ''
                ? const CircularProgressIndicator()
                : mat.Image.file(
                    File(_image),
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      width: 100,
                      height: 100,
                      child: const Center(
                        child: Text('Error load image',
                            textAlign: TextAlign.center),
                      ),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _processImage,
        tooltip: 'Process Image',
        child: const Icon(Icons.image_outlined),
      ),
    );
  }
}
