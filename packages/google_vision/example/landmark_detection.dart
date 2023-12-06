import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  final imageFile = File('sample_image/cn_tower.jpg').readAsBytesSync();

  print('checking...');

  final annotatedResponses = await googleVision.annotate(
    requests: AnnotationRequests(
      requests: [
        AnnotationRequest(
            jsonImage: JsonImage(byteBuffer: imageFile.buffer),
            features: [
              Feature(maxResults: 10, type: AnnotationType.landmarkDetection)
            ])
      ],
    ),
  );

  for (var landmarkAnnotation
      in annotatedResponses.responses.first.landmarkAnnotations) {
    print('score: ${landmarkAnnotation.score}');

    print('Landmark: ${landmarkAnnotation.description}');

    print(landmarkAnnotation.boundingPoly!.vertices);
  }

  print('done.');
}
