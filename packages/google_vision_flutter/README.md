# Google Vision Images Flutter Widget

![SDK version](https://badgen.net/pub/sdk-version/google_vision_flutter?style=for-the-badge)
![Supported platforms](https://badgen.net/pub/flutter-platform/google_vision_flutter?style=for-the-badge)
![Supported SDKs](https://badgen.net/pub/dart-platform/google_vision_flutter?style=for-the-badge)

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection into Flutter applications.

Please feel free to submit PRs for any additional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

## Table of Contents
- [Google Vision Images Flutter Widget](#google-vision-images-flutter-widget)
  - [Table of Contents](#table-of-contents)
  - [Recent Changes](#recent-changes)
    - [New for v2.0.0](#new-for-v200)
    - [New for v1.4.0](#new-for-v140)
  - [Getting Started](#getting-started)
    - [pubspec.yaml](#pubspecyaml)
    - [Obtaining Authorization Credentials](#obtaining-authorization-credentials)
    - [Usage of the GoogleVisionBuilder Widget](#usage-of-the-googlevisionbuilder-widget)
  - [ShoutOut](#shoutout)
  - [Contributing](#contributing)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/google_vision_flutter.svg?logo=dart&logoColor=00b9fc&color=blue&style=for-the-badge)](https://pub.dartlang.org/packages/google_vision_flutter)
[![Code Size](https://img.shields.io/github/languages/code-size/faithoflifedev/google_vision_workspace?logo=github&logoColor=white&style=for-the-badge)](https://github.com/faithoflifedev/google_vision_workspace)
[![Publisher](https://img.shields.io/pub/publisher/google_vision_flutter?style=for-the-badge)](https://pub.dev/publishers/muayid.com)

[![Build Status](https://img.shields.io/github/actions/workflow/status/faithoflifedev/google_vision_workspace/flutter.yaml?branch=main&logo=github-actions&logoColor=white&style=for-the-badge)](https://github.com/faithoflifedev/google_vision_workspace/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/faithoflifedev/google_vision_workspace?logo=github&logoColor=white&style=for-the-badge)](https://github.com/faithoflifedev/flutter_image_converter/pulls)
[![Issues](https://img.shields.io/github/issues/faithoflifedev/google_vision_workspace?logo=github&logoColor=white&style=for-the-badge)](https://github.com/faithoflifedev/google_vision_workspace/issues)
[![github last commit](https://shields.io/github/last-commit/faithoflifedev/google_vision?logo=github&logoColor=white&style=for-the-badge)](https://shields.io/github/last-commit/faithoflifedev/google_vision)
[![Pub Score](https://img.shields.io/pub/points/google_vision_flutter?logo=dart&logoColor=00b9fc&style=for-the-badge)](https://pub.dev/packages/google_vision_flutter/score)


[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## Recent Changes

### New for v2.0.0
  - Even though this package worked when used with the `web` platform the **pub.dev** analyzer would not show it as `web` platform compatible due to the use of the `universal_io` package which has a dependency on `dart:io`.  This version has removed the `universal_io` dependency from the core package, so some related method signatures have been removed.
  - The deprecated methods from in v1.3.x have been removed in this version.
  - Logging functionality has been added to the package
  ```dart
  final googleVision = await GoogleVision(LogLevel.all).withJwtFile('service_credentials.json');
  ```

### New for v1.4.0
  - A **breaking change** from the previous version is that the `GoogleVision` class now follows the Singleton design pattern.  Now the object is instantiated as follows:
```dart

// Old method from v1.3.x and earlier
// final googleVision = await GoogleVision.withJwtFile('service_credentials.json');

// New
final googleVision = await GoogleVision().withJwtFile('service_credentials.json');
```

## Getting Started

### pubspec.yaml

To use this package, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  google_vision_flutter: ^2.0.0+3
```


### Obtaining Authorization Credentials

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires an API key or a JSON file with the JWT token information.  The JWT token can obtained by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the Google API console.

### Usage of the GoogleVisionBuilder Widget

See the [example app](https://github.com/faithoflifedev/google_vision_workspace/tree/main/packages/google_vision_flutter/example) for the full code.

```dart
import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';

class LabelDetectionPage extends ExampleBase {

  // final googleVision =
  //   GoogleVision().withAsset('assets/service_credentials.json');

  static const assetName = 'assets/setagaya_small.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  LabelDetectionPage({
    super.key,
    required super.googleVision,
    required super.title,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: getAppBar(context),
          body: simpleColumn(
            assetName: assetName,
            sampleImage: _processImage,
            result: GoogleVisionImageBuilder.labelDetection(
              googleVision: googleVision,
              imageProvider: _processImage.image,
              builder: (
                BuildContext context,
                List<EntityAnnotation>? entityAnnotations,
              ) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: entityAnnotations!
                        .map((entity) => Text(
                            '${(entity.score! * 100).toStringAsFixed(2)}% - ${entity.description}'))
                        .toList()),
              ),
            ),
          ),
        ),
      );
}

/// See the example project for all the necessary code.

```

<center><img src="https://github.com/faithoflifedev/google_vision_workspace/blob/main/packages/google_vision_flutter/screenshot/face_detection.png?raw=true&amp;v1" width="320"></center>

## ShoutOut

 - To [Andrii Syrokomskyi](https://github.com/signmotion) for creating [flutter_image_converter](https://github.com/signmotion/flutter_image_converter), I've borrowed some of the code included in the `flutter_image_converter` in this package.  This package originally had a dependency on `flutter_image_converter`, but that had to be removed to achieve `web` platform support.

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