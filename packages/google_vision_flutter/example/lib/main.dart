import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide WebDetection;

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
      GoogleVision().withAsset('assets/service_credentials.json');

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
        '/crophints': (context) => CropHintsPage(
              googleVision: googleVision,
              title: 'Crop Hints',
            ),
        '/documenttextdetection': (context) => DocumentTextDetectionPage(
              googleVision: googleVision,
              title: 'Document Text Detection',
            ),
        '/documenttextdetectionfile': (context) =>
            DocumentTextDetectionFilePage(
              googleVision: googleVision,
              title: 'Document Text Detection',
            ),
        '/facedetection': (context) => FaceDetectionPage(
              googleVision: googleVision,
              title: 'Face Detection',
            ),
        '/imageproperties': (context) => ImagePropertiesPage(
              googleVision: googleVision,
              title: 'Image Properties',
            ),
        '/labeldetection': (context) => LabelDetectionPage(
              googleVision: googleVision,
              title: 'Label Detection',
            ),
        '/landmarkdetection': (context) => LandmarkDetectionPage(
              googleVision: googleVision,
              title: 'Landmark Detection',
            ),
        '/logodetection': (context) => LogoDetectionPage(
              googleVision: googleVision,
              title: 'Logo Detection',
            ),
        '/objectlocalization': (context) => ObjectLocalizationPage(
              googleVision: googleVision,
              title: 'Object Localization',
            ),
        '/safesearchdetection': (context) => SafeSearchDetectionPage(
              googleVision: googleVision,
              title: 'Safe Search Detection',
            ),
        '/textdetection': (context) => TextDetectionPage(
              googleVision: googleVision,
              title: 'Text Detection',
            ),
        '/webdetection': (context) => WebDetectionPage(
              googleVision: googleVision,
              title: 'Web Detection',
            ),
        '/multipleface': (context) => MultipleFaceDetectionPage(
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
            ElevatedButton(
              child: const Text('Multiple Image Face Detection'),
              onPressed: () => Navigator.pushNamed(context, '/multipleface'),
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
