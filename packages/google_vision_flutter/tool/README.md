# Google Vision Images Flutter Widget

[![pub package](https://img.shields.io/pub/v/google_vision_flutter.svg)](https://pub.dartlang.org/packages/google_vision_flutter)

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection into Flutter applications.

[![Build Status](https://github.com/faithoflifedev/google_vision/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/google_vision/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/google_vision)](https://shields.io/github/last-commit/faithoflifedev/google_vision) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/google_vision_workspace/flutter.yaml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/google_vision/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/google_vision)](https://shields.io/github/issues/faithoflifedev/google_vision)

Please feel free to submit PRs for any additional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

## Table of Contents

- [Google Vision Images Flutter Widget](#google-vision-images-flutter-widget)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [pubspec.yaml](#pubspecyaml)
    - [Obtaining Authorization Credentials](#obtaining-authorization-credentials)
    - [Usage of the GoogleVisionBuilder Widget](#usage-of-the-googlevisionbuilder-widget)
  - [Contributing](#contributing)

## Getting Started

### pubspec.yaml

To use this package, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  google_vision_flutter: ^{{ pubspec.version }}
```


### Obtaining Authorization Credentials

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.

### Usage of the GoogleVisionBuilder Widget

See the [example app](https://github.com/faithoflifedev/google_vision_workspace/tree/main/packages/google_vision_flutter/example) for the full code.

```dart
import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

class FaceDetection extends StatefulWidget {
  const FaceDetection({super.key, required this.title});

  final String title;

  @override
  State<FaceDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FaceDetection> {
  final _processImage = Image.asset(
    'assets/young-man-smiling.jpg',
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
                  child: Text('assets/young-man-smiling.jpg'),
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
                  child: GoogleVisionBuilder.faceDetection(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (BuildContext context,
                            List<gv.FaceAnnotation>? faceAnnotations,
                            ImageDetail imageDetail) =>
                        CustomPaint(
                      foregroundPainter: AnnotationPainter(
                        faceAnnotations: faceAnnotations,
                        imageDetail: imageDetail,
                      ),
                      child: Image(image: _processImage.image),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

/// See the example project for all the necessary code.

```

<center><img src="https://github.com/faithoflifedev/google_vision_workspace/blob/main/packages/google_vision_flutter/screenshot/face_detection.png?raw=true&amp;v1" width="320"></center>

## Major Changes for v1.1.x

Starting with this version of the package, the `google_vision` package is not re-exported by `google_vision_flutter`, this means that you must import `google_vision` manually in the cases that you need any classes that are part of it's API.

```dart
import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

GoogleVisionBuilder.faceDetection(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (BuildContext context,
                            List<gv.FaceAnnotation>? faceAnnotations,
                            ImageDetail imageDetail) =>
                        CustomPaint(
                      foregroundPainter: AnnotationPainter(
                        faceAnnotations: faceAnnotations,
                        imageDetail: imageDetail,
                      ),
                      child: Image(image: _processImage.image),
                    ),
                  ),
```

In this code snippet the `FaceAnnotation` class is referenced as `gv.FaceAnnotation` since the class is part of the `google_vision` package.

Previous versions of the `google_vision_flutter` package reexported the `google_vision` package as part of the it's library definition.  This lead to warnings like:

```text
warning: private API of package:google_Vision is reexported by libraries in other packages:
```

During analysis of the package.  The updated package does not generate these warnings.

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