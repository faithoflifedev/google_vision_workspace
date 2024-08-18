import 'package:flutter/material.dart';

import 'crop_hints.dart';
import 'document_text_detection.dart';
import 'document_text_detection_file.dart';
import 'face_detection.dart';
import 'image_properties.dart';
import 'label_detection.dart';
import 'landmark_detection.dart';
import 'logo_detection.dart';
import 'multiple_detections.dart';
import 'object_localization.dart';
import 'safe_search_detection.dart';
import 'text_detection.dart';
import 'web_detection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MenuScreen(),
        '/multiple': (context) => const MultipleDetections(
              title: 'Object and Face Detection',
            ),
        '/crophints': (context) => const CropHints(
              title: 'Crop Hints',
            ),
        '/documenttextdetection': (context) => const DocumentTextDetection(
              title: 'Document Text Detection',
            ),
        '/documenttextdetectionfile': (context) =>
            const DocumentTextDetectionFile(
              title: 'Document Text Detection',
            ),
        '/facedetection': (context) => const FaceDetection(
              title: 'Face Detection',
            ),
        '/imageproperties': (context) => const ImageProperties(
              title: 'Image Properties',
            ),
        '/labeldetection': (context) => const LabelDetection(
              title: 'Label Detection',
            ),
        '/landmarkdetection': (context) => const LandmarkDetection(
              title: 'Landmark Detection',
            ),
        '/logodetection': (context) => const LogoDetection(
              title: 'Logo Detection',
            ),
        '/objectlocalization': (context) => const ObjectLocalization(
              title: 'Object Localization',
            ),
        '/safesearchdetection': (context) => const SafeSearchDetection(
              title: 'Safe Search Detection',
            ),
        '/textdetection': (context) => const TextDetection(
              title: 'Text Detection',
            ),
        '/webdetection': (context) => const WebDetection(
              title: 'Document Text Detection from PDF',
            ),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 30,
              child: Text('Image Functions'),
            ),
            ElevatedButton(
              child: const Text('Multiple Detections'),
              onPressed: () => Navigator.pushNamed(context, '/multiple'),
            ),
            ElevatedButton(
              child: const Text('Crop Hints'),
              onPressed: () => Navigator.pushNamed(context, '/crophints'),
            ),
            ElevatedButton(
              child: const Text('Document Text Detection'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/documenttextdetection'),
            ),
            ElevatedButton(
              child: const Text('Face Detection'),
              onPressed: () => Navigator.pushNamed(context, '/facedetection'),
            ),
            ElevatedButton(
              child: const Text('Image Properties'),
              onPressed: () => Navigator.pushNamed(context, '/imageproperties'),
            ),
            ElevatedButton(
              child: const Text('Label Detection'),
              onPressed: () => Navigator.pushNamed(context, '/labeldetection'),
            ),
            ElevatedButton(
              child: const Text('Landmark Detection'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/landmarkdetection'),
            ),
            ElevatedButton(
              child: const Text('Logo Detection'),
              onPressed: () => Navigator.pushNamed(context, '/logodetection'),
            ),
            ElevatedButton(
              child: const Text('Object Localization'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/objectlocalization'),
            ),
            ElevatedButton(
              child: const Text('Safe Search Detection'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/safesearchdetection'),
            ),
            ElevatedButton(
              child: const Text('Text Detection'),
              onPressed: () => Navigator.pushNamed(context, '/textdetection'),
            ),
            ElevatedButton(
              child: const Text('Web Detection'),
              onPressed: () => Navigator.pushNamed(context, '/webdetection'),
            ),
            const SizedBox(
              height: 30,
              child: Text('File Functions'),
            ),
            ElevatedButton(
              child: const Text('Document Text Detection from PDF'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/documenttextdetectionfile'),
            ),
          ],
        ),
      ),
    );
  }
}
