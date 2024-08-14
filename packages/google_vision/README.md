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
  - [New Helper Methods](#new-helper-methods)
  - [Usage with Flutter](#usage-with-flutter)
  - [Vision cli (google\_vision at the command prompt)](#vision-cli-google_vision-at-the-command-prompt)
  - [Reference](#reference)
  - [Contributors](#contributors)
  - [Contributing](#contributing)

## Project Status

[![pub package](https://img.shields.io/pub/v/google_vision.svg)](https://pub.dartlang.org/packages/google_vision)

[![Build Status](https://github.com/faithoflifedev/google_vision/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/google_vision/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/google_vision)](https://shields.io/github/last-commit/faithoflifedev/google_vision) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/google_vision_workspace/dart.yaml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/google_vision/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/google_vision)](https://shields.io/github/issues/faithoflifedev/google_vision)

Please feel free to submit PRs for any additional helper methods, or report an [issue](https://github.com/faithoflifedev/google_vision/issues) for a missing helper method and I'll add it if I have time available.

## Recent Changes

### New for v1.3.0
  - This version of the package supports both the `image` and `file` annotation APIs for Google Vision.  The previous versions of the package supported only the `image` API.
  - A number of methods and classes have been **Deprecated** in this version.  All the provided examples still work without any changes, so the changes in this package should not cause any issue to existing code.
  - The `file` functionality added to this release allows for the annotation of file formats that have pages or frames, specifically `pdf`, `tiff` and `gif`.  Google Vision allows annotation of up to 5 pages/frames.

### New for v1.2.0
  - helper methods that simplify any `single` detection so a simple face detection can be performed with the `faceDetection(JsonImage jsonImage)` method, see the table below.

### New for v1.0.8
  - web entities and pages detection [https://cloud.google.com/vision/docs/detecting-web](https://cloud.google.com/vision/docs/detecting-web), provides urls of web pages that match the specified image

## Getting Started

### pubspec.yaml

To use this package, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  google_vision: ^1.3.0
```

### Obtaining Authentication/Authorization Credentials

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) can be done with one of two methods: 
 - The first method requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.
 - The second method requires an [API key](https://console.cloud.google.com/apis/credentials) to be created.

Both of the authorization/authentication methods listed above assume that you already have a Google account, you have created a Google Cloud project and you have enabled the Cloud Vision API in the Google API library.

### Usage of the Cloud Vision API

```dart
final googleVision = await GoogleVision.withApiKey(
  Platform.environment['GOOGLE_VISION_API_KEY'] ?? '[YOUR API KEY]',
  // additionalHeaders: {'com.xxx.xxx': 'X-Ios-Bundle-Identifier'},
);

print('checking...');

final faceAnnotationResponses = await googleVision.image.faceDetection(
    JsonImage.fromGsUri(
        'gs://gvision-demo/young-man-smiling-and-thumbs-up.jpg'));

for (var faceAnnotation in faceAnnotationResponses) {
  print('Face - ${faceAnnotation.detectionConfidence}');

  print('Joy - ${faceAnnotation.enumJoyLikelihood}');
}

// Output:
// Face - 0.9609375
// Joy - Likelihood.UNLIKELY

print('done.');
```

## New Helper Methods

| <div style="width:420px">**Method Signature** | **Description** |
| -------------------- | --------------- |
| Future\<AnnotateImageResponse> **detection**(<br/>&nbsp;&nbsp;JsonImage jsonImage,<br/>&nbsp;&nbsp;AnnotationType annotationType,<br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Lower level method for a single detection type as specified by annotationType |
| Future<CropHintsAnnotation?> **cropHints**(<br/>&nbsp;&nbsp;JsonImage jsonImage,<br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Crop Hints suggests vertices for a crop region on an image. |
| Future<FullTextAnnotation?> **documentTextDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Extracts text from an image (or file); the response is optimized for dense text and documents. The break information.  A specific use of documentTextDetection is to detect handwriting in an image. |
| Future<List\<FaceAnnotation>> **faceDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Face Detection detects multiple faces within an image along with the associated key facial attributes such as emotional state or wearing headwear. |
| Future<ImagePropertiesAnnotation?> **imageProperties**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | The Image Properties feature detects general attributes of the image, such as dominant color. |
| Future<List\<EntityAnnotation>> **labelDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Labels can identify general objects, locations, activities, animal species, products, and more.  Labels are returned in English only. |
| Future<List\<EntityAnnotation>> **landmarkDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Landmark Detection detects popular natural and human-made structures within an image. |
| Future<List\<EntityAnnotation>> **logoDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Logo Detection detects popular product logos within an image. |
| Future<List\<LocalizedObjectAnnotation>> **objectLocalization**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | The Vision API can detect and extract multiple objects in an image with Object Localization.  Object localization identifies multiple objects in an image and provides a LocalizedObjectAnnotation for each object in the image. Each LocalizedObjectAnnotation identifies information about the object, the position of the object, and rectangular bounds for the region of the image that contains the object.  Object localization identifies both significant and less-prominent objects in an image. |
| Future<SafeSearchAnnotation?> **safeSearchDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | SafeSearch Detection detects explicit content such as adult content or violent content within an image. This feature uses five categories (adult, spoof, medical, violence, and racy) and returns the likelihood that each is present in a given image. See the SafeSearchAnnotation page for details on these fields. |
| Future<List\<EntityAnnotation>> **textDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Detects and extracts text from any image. For example, a photograph might contain a street sign or traffic sign. The JSON includes the entire extracted string, as well as individual words, and their bounding boxes. |
| Future<WebDetection?> **webDetection**(<br/>&nbsp;&nbsp;JsonImage jsonImage, <br/>&nbsp;&nbsp;{int maxResults = 10,}<br/>) | Web Detection detects Web references to an image. |

## Usage with Flutter

For a quick intro into the use of Google Vision in a Flutter, take a look at the [`google_vision_flutter`](https://github.com/faithoflifedev/google_vision_workspace/tree/main/packages/google_vision_flutter) package and the [example](https://github.com/faithoflifedev/google_vision_workspace/tree/main/packages/google_vision_flutter/example) folder of the project's GitHub repository.

If Flutter specific Google Vision Widget doesn't meet your requirements, then to work with Flutter it's usually necessary to convert an object that is presented as an `Asset` or a `Stream` into a `File` for use by this `google_vision` package.  This [StackOverflow](https://stackoverflow.com/questions/55295593/how-to-convert-asset-image-to-file) post gives an idea on how this can be accomplished.  A similar process can be used for any `Stream` of data that represents an image supported by `google_vision`.  Essentially, the Google Vision REST API needs to be able to convert the image data into its Base64 representation before submitting it to the Google server and having the `bytedata` available in the code makes this easier. 

## Vision cli (google_vision at the command prompt)

This package included a cli utility that can be used to return data for any API call currently supported by the package. If you want to get started quickly with the cli utility run these commands in a terminal session:

Install using `dart pub`:

```sh
dart pub global activate google_vision
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