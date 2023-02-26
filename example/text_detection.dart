import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwt('example/skc-live-decbd0969cbb.json');

  final painter = Painter.fromFilePath('example/structures.png');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(
        image: painter,
        features: [Feature(maxResults: 10, type: 'TEXT_DETECTION')])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: requests);

  print('done.\n');

  for (var annotatedResponse in annotatedResponses.responses) {
    for (var textAnnotation in annotatedResponse.textAnnotations) {
      GoogleVision.drawText(
          painter,
          textAnnotation.boundingPoly!.vertices.first.x + 2,
          textAnnotation.boundingPoly!.vertices.first.y + 2,
          textAnnotation.description);

      GoogleVision.drawAnnotations(
          painter, textAnnotation.boundingPoly!.vertices);
    }
  }

  await painter.writeAsJpeg('example/debugImage.jpg');
}
