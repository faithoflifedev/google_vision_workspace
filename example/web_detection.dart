import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('example/skc-live-decbd0969cbb.json');

  final painter = Painter.fromFilePath('example/structures.png');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(
        image: Image(painter: painter),
        features: [Feature(maxResults: 10, type: 'WEB_DETECTION')])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: requests);

  print(annotatedResponses);

  print('done.\n');
}
