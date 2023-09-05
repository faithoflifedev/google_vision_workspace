import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('example/skc-live-decbd0969cbb.json');

  final painter = Painter.fromFilePath('example/cn_tower.jpg');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(
        image: Image(painter: painter),
        features: [Feature(maxResults: 10, type: 'LANDMARK_DETECTION')])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: requests);

  print('done.\n');

  for (var annotatedResponse in annotatedResponses.responses) {
    for (var landmarkAnnotation in annotatedResponse.landmarkAnnotations) {
      GoogleVision.drawText(
          painter,
          landmarkAnnotation.boundingPoly!.vertices.first.x + 2,
          landmarkAnnotation.boundingPoly!.vertices.first.y + 2,
          landmarkAnnotation.description);

      GoogleVision.drawAnnotations(
          painter, landmarkAnnotation.boundingPoly!.vertices);
    }
  }

  await painter.writeAsJpeg('example/debugImage.jpg');
}
