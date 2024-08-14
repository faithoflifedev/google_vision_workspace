import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  final imageFile = File('sample_image/structures.png').readAsBytesSync();

  print('checking...');

  AnnotatedResponses annotatedResponses = await googleVision.annotate(
    requests: AnnotateImageRequests(
      requests: [
        AnnotateImageRequest(
            jsonImage: JsonImage(byteBuffer: imageFile.buffer),
            features: [
              Feature(maxResults: 10, type: AnnotationType.webDetection)
            ])
      ],
    ),
  );

  print(annotatedResponses);

  // for (var webDetection
  //     in annotatedResponses.responses.first.webDetection.webEntities) {
  //   print(webDetection.description);

  //   print(webDetection.boundingPoly!.vertices);
  // }
}
