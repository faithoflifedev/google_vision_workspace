# Youtube REST API Client

[![pub package](https://img.shields.io/pub/v/google_vision.svg)](https://pub.dartlang.org/packages/google_vision)

Native [Dart](https://dart.dev/) package that integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.

- [v1/images](https://cloud.google.com/vision/docs/reference/rest/v1/images)

## Getting Started

To use this package, add the dependency to your pubspec.yaml file:

```yaml
dependencies:
  ...
  google_vsion: ^1.0.0
```

## Obtaining Authorization Credentials

Youtube API access requires an access token or API key depending on the API and the type of information being accessed. As a general rule of thumb, read-only public information cand be accessed through an API key, otherwise an access token is required.

The yt library supports three mechanisms for authentication. All of the authentication schemes require some configuration in the [Google API console](https://developers.google.com/youtube/v3/live/registering_an_application). The document [Obtaining authorization credentials](https://developers.google.com/youtube/v3/live/registering_an_application) covers authentication with [OAuth 2.0](https://developers.google.com/identity/protocols/OAuth2) which works for both the Data API and the Live Streaming API the same document also covers authenticating with API keys which works only with the Data API.

More in depth documentation on how OAuth2 works within the **yt library** is available in the [OAuth 2.0 for Mobile & Desktop Apps](https://developers.google.com/identity/protocols/oauth2/native-app) document. Overall, for OAuth2 the library takes a provided single use auth code and generates a long lived OAuth2 refresh token that is persisted as a hidden file.

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.

All of the above authentication methods will work for Flutter apps as well, however you may want to instead allow your app's users to use their own YouTube credentials. Instructions for authenticating this way are included at the end of this document in the _Usage within Flutter_ section.

A number of the examples use OAuth 2.0 for authentication. The examples have the OAuth2 credentials made available to sample the code though a **.yaml** file that contains these lines:

```yaml
url: https://oauth2.googleapis.com/token
clientId: [client id from the API console]
clientSecret: [client secret from the API console]
code: [single use auth code]
```

There is an additional step required to generate the **_code_** needed for the above file. Once you have followed the instructions outlined in the YouTube docs for creating the app instance and obtaining the OAuth2 credentials, then the next step is to enter this url into a desktop browser:

**https://accounts.google.com/o/oauth2/auth?client_id=[client_id_from_the_API_console]&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/youtube&response_type=code**

Once you have completed the steps to authorize the provdided account with the app created in the API console, you will be presented with an single use authorization code. The code is entered as the **_code_** line in the _yaml_ file above.

## Usage of the Cloud Vision API

```dart
  final googleVision = await GoogleVision.withJwt(
      'example/skc-live-decbd0969cbb.json',
      'https://www.googleapis.com/auth/cloud-vision');

  final image =
      Image.fromFilePath('example/young-man-smiling-and-thumbs-up.jpg');

  final cropped = image.copyCrop(70, 30, 640, 480);
  // final cropped = image.copyCrop(1060, 410, 460, 340);

  await cropped.writeAsJpeg('example/cropped.jpg');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(image: cropped, features: [
      Feature(maxResults: 10, type: DetectionType.FACE_DETECTION.value),
      Feature(maxResults: 10, type: DetectionType.OBJECT_LOCALIZATION.value)
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

///output the results as a new image file
await cropped.writeAsJpeg('resulting_image.jpg');
```
