import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwt('example/skc-live-decbd0969cbb.json');

  final painter = Painter.fromFilePath('example/logo.png');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(
        image: Image(painter: painter),
        features: [Feature(maxResults: 10, type: 'LOGO_DETECTION')])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: requests);

  print('done.\n');

  for (var annotatedResponse in annotatedResponses.responses) {
    for (var logoAnnotation in annotatedResponse.logoAnnotations) {
      GoogleVision.drawText(
          painter,
          logoAnnotation.boundingPoly!.vertices.first.x + 2,
          logoAnnotation.boundingPoly!.vertices.first.y + 2,
          logoAnnotation.description);

      GoogleVision.drawAnnotations(
          painter, logoAnnotation.boundingPoly!.vertices);
    }
  }

  await painter.writeAsJpeg('example/debugImage.jpg');
}
