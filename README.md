# Google Vision images REST API Client

[![pub package](https://img.shields.io/pub/v/google_vision.svg)](https://pub.dartlang.org/packages/google_vision)

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.

- [v1/images](https://cloud.google.com/vision/docs/reference/rest/v1/images)

[![Build Status](https://github.com/faithoflifedev/google_vision/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/google_vision/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/google_vision)](https://shields.io/github/last-commit/faithoflifedev/google_vision) [![github build](https://shields.io/github/workflow/status/faithoflifedev/google_vision/Dart)](https://shields.io/github/workflow/status/faithoflifedev/google_vision/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/google_vision)](https://shields.io/github/issues/faithoflifedev/google_vision)

Please feel free to submit PRs for any addtional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

## New for v1.0.3

The package now includes `Product Search` functionality.  But be warned, it is completely experimental, there has been little to no testing done.

## Bonus Feature

This package included a cli utility that can be used to return data for any API call currently supported by the package. If you want to get started quicky with the cli utility run these commands in a termainal session:

```sh
pub global activate vision

vision --help
```

Please see the cli documentation [README.md](https://github.com/faithoflifedev/google_vision/tree/main/bin) for more detailed usage information.

## Getting Started

To use this package, add the dependency to your pubspec.yaml file:

```yaml
dependencies:
  ...
  google_vsion: ^1.0.3
```

## Obtaining Authorization Credentials

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.

## Usage of the Cloud Vision API

```dart
  final googleVision =
      await GoogleVision.withJwt('my_jwt_credentials.json');

  final image =
      Image.fromFilePath('example/young-man-smiling-and-thumbs-up.jpg');

  //cropping an image can save time uploading the image to Google
  final cropped = image.copyCrop(70, 30, 640, 480);

  await cropped.writeAsJpeg('example/cropped.jpg');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(image: cropped, features: [
      Feature(maxResults: 10, type: 'FACE_DETECTION'),
      Feature(maxResults: 10, type: 'OBJECT_LOCALIZATION')
    ])
  ]);

  final annotatedResponses =
      await googleVision.annotate(requests: requests);

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
    //look only for Person annotations
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

//output the results as a new image file
await cropped.writeAsJpeg('resulting_image.jpg');
```
