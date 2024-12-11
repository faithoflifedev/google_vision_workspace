import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide WebDetection;
import 'package:loggy/loggy.dart';

import 'crop_hints_page.dart';
import 'document_text_detection_page.dart';
import 'document_text_detection_file_page.dart';
import 'face_detection_page.dart';
import 'image_properties_page.dart';
import 'label_detection_page.dart';
import 'landmark_detection_page.dart';
import 'logo_detection_page.dart';
import 'multiple_detections_page.dart';
import 'multiple_face_detections_page.dart';
import 'object_localization_page.dart';
import 'safe_search_detection_page.dart';
import 'text_detection_page.dart';
import 'web_detection_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final googleVision =
      GoogleVision(LogLevel.off).withAsset('assets/service_credentials.json');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MenuScreen(),
        '/multiple': (context) => MultipleDetectionsPage(
              googleVision: googleVision,
              title: 'Multiple Detections',
            ),
        '/cropHints': (context) => CropHintsPage(
              googleVision: googleVision,
              title: 'Crop Hints',
            ),
        '/documentTextDetection': (context) => DocumentTextDetectionPage(
              googleVision: googleVision,
              title: 'Document Text Detection',
            ),
        '/documentTextDetectionFile': (context) =>
            DocumentTextDetectionFilePage(
              googleVision: googleVision,
              title: 'Document Text Detection',
            ),
        '/faceDetection': (context) => FaceDetectionPage(
              googleVision: googleVision,
              title: 'Face Detection',
            ),
        '/imageProperties': (context) => ImagePropertiesPage(
              googleVision: googleVision,
              title: 'Image Properties',
            ),
        '/labelDetection': (context) => LabelDetectionPage(
              googleVision: googleVision,
              title: 'Label Detection',
            ),
        '/landmarkDetection': (context) => LandmarkDetectionPage(
              googleVision: googleVision,
              title: 'Landmark Detection',
            ),
        '/logoDetection': (context) => LogoDetectionPage(
              googleVision: googleVision,
              title: 'Logo Detection',
            ),
        '/objectLocalization': (context) => ObjectLocalizationPage(
              googleVision: googleVision,
              title: 'Object Localization',
            ),
        '/safeSearchDetection': (context) => SafeSearchDetectionPage(
              googleVision: googleVision,
              title: 'Safe Search Detection',
            ),
        '/textDetection': (context) => TextDetectionPage(
              googleVision: googleVision,
              title: 'Text Detection',
            ),
        '/webDetection': (context) => WebDetectionPage(
              googleVision: googleVision,
              title: 'Web Detection',
            ),
        '/multipleFace': (context) => MultipleFaceDetectionPage(
              googleVision: googleVision,
              title: 'Multiple Image Face Detection',
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
              onPressed: () => Navigator.pushNamed(context, '/cropHints'),
            ),
            ElevatedButton(
              child: const Text('Document Text Detection'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/documentTextDetection'),
            ),
            ElevatedButton(
              child: const Text('Face Detection'),
              onPressed: () => Navigator.pushNamed(context, '/faceDetection'),
            ),
            ElevatedButton(
              child: const Text('Image Properties'),
              onPressed: () => Navigator.pushNamed(context, '/imageProperties'),
            ),
            ElevatedButton(
              child: const Text('Label Detection'),
              onPressed: () => Navigator.pushNamed(context, '/labelDetection'),
            ),
            ElevatedButton(
              child: const Text('Landmark Detection'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/landmarkDetection'),
            ),
            ElevatedButton(
              child: const Text('Logo Detection'),
              onPressed: () => Navigator.pushNamed(context, '/logoDetection'),
            ),
            ElevatedButton(
              child: const Text('Object Localization'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/objectLocalization'),
            ),
            ElevatedButton(
              child: const Text('Safe Search Detection'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/safeSearchDetection'),
            ),
            ElevatedButton(
              child: const Text('Text Detection'),
              onPressed: () => Navigator.pushNamed(context, '/textDetection'),
            ),
            ElevatedButton(
              child: const Text('Web Detection'),
              onPressed: () => Navigator.pushNamed(context, '/webDetection'),
            ),
            ElevatedButton(
              child: const Text('Multiple Image Face Detection'),
              onPressed: () => Navigator.pushNamed(context, '/multipleFace'),
            ),
            const SizedBox(
              height: 30,
              child: Text('File Functions'),
            ),
            ElevatedButton(
              child: const Text('Document Text Detection from PDF'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/documentTextDetectionFile'),
            ),
          ],
        ),
      ),
    );
  }
}
