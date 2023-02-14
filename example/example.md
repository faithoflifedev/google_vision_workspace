# Google Vision command line example

Provides a basic [example](https://github.com/faithoflifedev/google_vision/tree/main/example) of how the package can be used to perform image processing from the command line

```sh
dart run example/example.dart
```

```dart
import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwt('example/skc-live-decbd0969cbb.json');

  final painter =
      Painter.fromFilePath('example/young-man-smiling-and-thumbs-up.jpg');

  final cropped = painter.copyCrop(70, 30, 640, 480);

  await cropped.writeAsJpeg('example/cropped.jpg');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(image: cropped, features: [
      Feature(maxResults: 10, type: 'FACE_DETECTION'),
      Feature(maxResults: 10, type: 'OBJECT_LOCALIZATION')
    ])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: requests);

  print('done.\n');

  for (var annotatedResponse in annotatedResponses.responses) {
    for (var faceAnnotation in annotatedResponse.faceAnnotations) {
      GoogleVision.drawText(
          cropped,
          faceAnnotation.boundingPoly.vertices.first.x + 2,
          faceAnnotation.boundingPoly.vertices.first.y + 2,
          'Face - ${faceAnnotation.detectionConfidence}');

      GoogleVision.drawAnnotations(
          cropped, faceAnnotation.boundingPoly.vertices);
    }
  }

  for (var annotatedResponse in annotatedResponses.responses) {
    annotatedResponse.localizedObjectAnnotations
        .where((localizedObjectAnnotation) =>
            localizedObjectAnnotation.name == 'Person')
        .toList()
        .forEach((localizedObjectAnnotation) {
      GoogleVision.drawText(
          cropped,
          (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.x *
                  cropped.width)
              .toInt(),
          (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.y *
                      cropped.height)
                  .toInt() -
              16,
          'Person - ${localizedObjectAnnotation.score}');

      GoogleVision.drawAnnotationsNormalized(
          cropped, localizedObjectAnnotation.boundingPoly.normalizedVertices);
    });
  }

  await cropped.writeAsJpeg('example/debugImage.jpg');
}
```

# Google Vision Flutter example

Provides a basic example of how the package can be used to perform image processing from within as a [Flutter app](https://github.com/faithoflifedev/google_vision/tree/main/example/flutter/vision_demo)

```sh
cd example/flutter/vision_demo/
flutter emulators
flutter emulators --launch apple_ios_simulator
flutter devices
flutter run -d [device id]
```