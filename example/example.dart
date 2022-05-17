import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwt('example/skc-live-decbd0969cbb.json');

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

  await cropped.writeAsJpeg('example/debugImage.jpg');
}
