import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('example/skc-live-decbd0969cbb.json');

  final painter =
      Painter.fromFilePath('example/young-man-smiling-and-thumbs-up.jpg');

  final cropped = painter.copyCrop(70, 30, 640, 480);

  await cropped.writeAsJpeg('example/cropped.jpg');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(image: Image(painter: cropped), features: [
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
