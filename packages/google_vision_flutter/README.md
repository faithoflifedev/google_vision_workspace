# Google Vision Images Flutter Widget

<center><img src="https://github.com/faithoflifedev/google_vision_workspace/blob/main/packages/google_vision_flutter/extra/google_vision_flutter.png?raw=true&amp;v1" width="320"></center>
<br/>

![SDK version](https://badgen.net/pub/sdk-version/google_vision_flutter?style=for-the-badge)
![Supported platforms](https://badgen.net/pub/flutter-platform/google_vision_flutter?style=for-the-badge)
![Supported SDKs](https://badgen.net/pub/dart-platform/google_vision_flutter?style=for-the-badge)

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection into Flutter applications.

Please feel free to submit PRs for any additional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

[![popularity](https://img.shields.io/pub/popularity/google_vision_flutter?style=for-the-badge&logo=dart)](https://pub.dev/packages/google_vision_flutter/score)
[![Pub Score](https://img.shields.io/pub/points/google_vision_flutter?logo=dart&logoColor=00b9fc&style=for-the-badge)](https://pub.dev/packages/google_vision_flutter/score)
[![likes](https://img.shields.io/pub/likes/google_vision_flutter?style=for-the-badge&logo=dart)](https://pub.dev/packages/google_vision_flutter/score)


## Table of Contents
- [Recent Changes](#recent-changes)
  - [New for v2.0.0](#new-for-v200)
  - [New for v1.4.0](#new-for-v140)
- [Getting Started](#getting-started)
  - [pubspec.yaml](#pubspecyaml)
  - [Obtaining Authorization Credentials](#obtaining-authorization-credentials)
  - [Usage of the GoogleVisionBuilder Widget](#usage-of-the-googlevisionbuilder-widget)
- [Contributors](#contributors)
- [Contributing](#contributing)

## Recent Changes

### New for v2.0.0
  - Even though this package worked when used with the `web` platform the **pub.dev** analyzer would not show it as `web` platform compatible due to the use of the `universal_io` package which has a dependency on `dart:io`.  This version has removed the `universal_io` dependency from the core package, so some related method signatures have been removed.
  - The deprecated methods from in v1.3.x have been removed in this version.
  - Logging functionality has been added to the package
  ```dart
final googleVision =
    GoogleVision(LogLevel.all).withAsset('assets/service_credentials.json');
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
  google_vision_flutter: ^2.0.0+8
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

<center><img src="https://github.com/faithoflifedev/google_vision_workspace/blob/main/packages/google_vision_flutter/extra/Screenshot.png?raw=true&amp;v1" width="320"></center>

## Contributors

- [hieupm2096](https://github.com/hieupm2096)

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