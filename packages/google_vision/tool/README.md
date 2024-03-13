# Google Vision Images REST API Client

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.

- [Google Vision Images REST API Client](#google-vision-images-rest-api-client)
  - [Project Status](#project-status)
  - [Recent Changes](#recent-changes)
    - [New for v1.2.0](#new-for-v120)
    - [New for v1.0.8](#new-for-v108)
    - [New for v1.0.7](#new-for-v107)
  - [Getting Started](#getting-started)
    - [pubspec.yaml](#pubspecyaml)
    - [Obtaining Authorization Credentials](#obtaining-authorization-credentials)
    - [Usage of the Cloud Vision API](#usage-of-the-cloud-vision-api)
  - [Usage with Flutter](#usage-with-flutter)
  - [Vision cli (google\_vision at the command prompt)](#vision-cli-google_vision-at-the-command-prompt)
  - [Reference](#reference)
  - [Contributors](#contributors)
  - [Contributing](#contributing)

## Project Status

[![pub package](https://img.shields.io/pub/v/google_vision.svg)](https://pub.dartlang.org/packages/google_vision)

[![Build Status](https://github.com/faithoflifedev/google_vision/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/google_vision/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/google_vision)](https://shields.io/github/last-commit/faithoflifedev/google_vision) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/google_vision/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/google_vision/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/google_vision)](https://shields.io/github/issues/faithoflifedev/google_vision)

Please feel free to submit PRs for any additional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

## Recent Changes

### New for v1.2.0
  - helper methods that simplify any `single` detection so a simple face detection can be performed with the `faceDetection(String filePathOrGsUri)` method

### New for v1.0.8
  - web entities and pages detection [https://cloud.google.com/vision/docs/detecting-web](https://cloud.google.com/vision/docs/detecting-web), provides urls of web pages that match the specified image

### New for v1.0.7

[JLuisRojas](https://github.com/JLuisRojas) has provided code for:
- detect text in images
- detect handwriting in images

In addition support for the following has also been added:
- detect crop hints
- detect image properties
- detect landmarks
- detect logos

## Getting Started

### pubspec.yaml

To use this package, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  google_vision: ^{{ pubspec.version }}
```

### Obtaining Authorization Credentials

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.

### Usage of the Cloud Vision API

```dart
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  final logoAnnotationsResponses =
      await googleVision.logoDetection('sample_image/logo.png');

  for (var logoAnnotation in logoAnnotationsResponses) {
    print('Logo: ${logoAnnotation.description}');

    print(logoAnnotation.boundingPoly?.vertices);
  }

  print('done.');
}
```

## Usage with Flutter

For a quick intro into the sing Google Vision in a Flutter app take a look at the [`google_vision_flutter`](https://github.com/faithoflifedev/google_vision_workspace/tree/main/packages/google_vision_flutter) package and it's [example app](https://github.com/faithoflifedev/google_vision_workspace/tree/main/packages/google_vision_flutter/example) folder of the project's GitHub repository.

If you for some reason need to get this package to work with Flutter it's usually necessary to convert an object that is presented as an `Asset` or a `Stream` into a `File` for use by the `google_vision` package.  This [stackoverflow](https://stackoverflow.com/questions/55295593/how-to-convert-asset-image-to-file) post gives an idea on how this can be accomplished.  A similar process can be used for any `Stream` of data that represents an image supported by `google_vision`.  Essentially, the Google Vision REST API needs to be able to convert the image data into its Base64 representation before submitting it to the Google server and having the `bytedata` available in the code makes this easier. 

## Vision cli (google_vision at the command prompt)

This package included a cli utility that can be used to return data for any API call currently supported by the package. If you want to get started quickly with the cli utility run these commands in a terminal session:

Install using `dart pub`:

```sh
dart pub global activate google_vision
```

Install using `brew`:

```sh
brew tap faithoflifedev/google_vision
brew install vision
```

Run the following command to see help:

```sh
vision --help
```

Result,

```text
A command line interface for making API requests to the Google Vision.

Usage: vision <command> [arguments]

Global options:
-h, --help                                       Print this usage information.
    --credential-file=<credentials file path>    (defaults to "/Users/chris/.vision/credentials.json")

Available commands:
  crop_hints  Set of crop hints that are used to generate new crops when serving images.
  detect      Run image detection and annotation for an images.
  highlight   Draw a box to highlight any objects detected.
  safe_search SafeSearch Detection detects explicit content such as adult content or violent content within an image.
  score       For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for".
```

Please see the cli documentation [README.md](https://github.com/faithoflifedev/google_vision/tree/main/bin) for more detailed usage information.

## Reference

[Cloud Vision API](https://cloud.google.com/vision/docs/reference/rest) - Documentation Reference

## Contributors

- [imhafeez](https://github.com/imhafeez)
- [4ctobias](https://github.com/4ctobias)
- [JLuisRojas](https://github.com/JLuisRojas)
- [DeadBryam](https://github.com/DeadBryam)
- [husitawi](https://github.com/husitawi)

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