# Google Vision Images Flutter Widget

[![pub package](https://img.shields.io/pub/v/google_vision.svg)](https://pub.dartlang.org/packages/google_vision)

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection into Flutter applications.

[![Build Status](https://github.com/faithoflifedev/google_vision/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/google_vision/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/google_vision)](https://shields.io/github/last-commit/faithoflifedev/google_vision) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/google_vision/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/google_vision/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/google_vision)](https://shields.io/github/issues/faithoflifedev/google_vision)

Please feel free to submit PRs for any additional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

## Table of Contents



## Getting Started

### pubspec.yaml

To use this package, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  google_vision_flutter: ^{{ pubspec.version }}
```

<!-- <img src="https://github.com/faithoflifedev/flip_card/blob/master/screenshots/young_man_smiling.png?raw=true&amp;v1" width="320"> -->


### Obtaining Authorization Credentials

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.

### Usage of the GoogleVisionBuilder Widget

```dart
GoogleVisionBuilder(
  // use the underlying `google_vision` package to initialize and authenticate for future API calls
  googleVision: GoogleVision.withAsset(
      'assets/service_credentials.json'),
  // the image that will be processed by the Google Vision API
  imageProvider: _processImage.image,
  // the features to detect in the image
  features: [
    Feature(
      maxResults: 10,
      type: AnnotationType
          .faceDetection,
    ),
    Feature(
      maxResults: 10,
      type: AnnotationType
          .objectLocalization,
    ),
  ],
  builder: (
    BuildContext context,
    AsyncSnapshot<AnnotatedResponses> snapshot,
    ImageDetail? imageDetail,
  ) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    if (snapshot.hasData) {
      // custom code that will write annotation text and boxes around detected objects (see example)
      return CustomPaint(
        foregroundPainter: AnnotationPainter(
          annotatedResponses: snapshot.data!,
          imageDetail: imageDetail!,
        ),
        child: Image(image: _processImage.image),
      );
    }

    return const Center(child: CircularProgressIndicator());
  },
)
```

## Contributing

Any help from the open-source community is always welcome and needed:
- Found an issue?
    - Please fill a bug report with details.
- Need a feature?
    - Open a feature request with use cases.
- Are you using and liking the project?
    - Promote the project: create an article or post about it
    - Make a donation
- Do you have a project that uses this package
    - let's cross promote, let me know and I'll add a link to your project
- Are you a developer?
    - Fix a bug and send a pull request.
    - Implement a new feature.
    - Improve the Unit Tests.
- Have you already helped in any way?
    - **Many thanks from me, the contributors and everybody that uses this project!**

*If you donate 1 hour of your time, you can contribute a lot, because others will do the same, just be part and start with your 1 hour.*