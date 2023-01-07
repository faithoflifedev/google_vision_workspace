import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;
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

    final tempDir = await getTemporaryDirectory();

    final fileName = temporaryFileName ?? assetFileName;

    final filePath =
        '${tempDir.path}${Platform.pathSeparator}$fileName'; // file_01.tmp is dump file, can be anything

    await File(filePath).delete();

    await File(filePath).writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return filePath;
  }

  void _processImage() async {
    final jwtFromAsset = await getFileFromAsset('service_credentials.json');

    final googleVision = await gv.GoogleVision.withJwt(jwtFromAsset);

    final imageFile = await getFileFromAsset(
        'young-man-smiling-and-thumbs-up.jpg',
        temporaryFileName: 'young-man-smiling-and-thumbs-up.jpg');

    final image = gv.Image.fromFilePath(imageFile);

    final requests = gv.AnnotationRequests(requests: [
      gv.AnnotationRequest(image: image, features: [
        gv.Feature(maxResults: 10, type: 'FACE_DETECTION'),
        gv.Feature(maxResults: 10, type: 'OBJECT_LOCALIZATION')
      ])
    ]);

    final annotatedResponses = await googleVision.annotate(requests: requests);

    for (var annotatedResponse in annotatedResponses.responses) {
      for (var faceAnnotation in annotatedResponse.faceAnnotations) {
        gv.GoogleVision.drawText(
            image,
            faceAnnotation.boundingPoly.vertices.first.x + 2,
            faceAnnotation.boundingPoly.vertices.first.y + 2,
            'Face - ${faceAnnotation.detectionConfidence}');

        gv.GoogleVision.drawAnnotations(
            image, faceAnnotation.boundingPoly.vertices);
      }
    }

    for (var annotatedResponse in annotatedResponses.responses) {
      annotatedResponse.localizedObjectAnnotations
          .where((localizedObjectAnnotation) =>
              localizedObjectAnnotation.name == 'Person')
          .toList()
          .forEach((localizedObjectAnnotation) {
        gv.GoogleVision.drawText(
            image,
            (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.x *
                    image.width)
                .toInt(),
            (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.y *
                        image.height)
                    .toInt() -
                16,
            'Person - ${localizedObjectAnnotation.score}');

        gv.GoogleVision.drawAnnotationsNormalized(
            image, localizedObjectAnnotation.boundingPoly.normalizedVertices);
      });
    }

    await image.writeAsJpeg(imageFile);

    setState(() {
      _image = imageFile;
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
                : Image.file(
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
