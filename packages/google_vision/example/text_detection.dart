import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision()
      .withJwt(File('service_credentials.json').readAsStringSync());

  final imageFile = File('sample_image/structures.png').readAsBytesSync();

  print('checking...');

  final annotatedResponses = await googleVision.image.annotate(
    requests: [
      AnnotateImageRequest(
          jsonImage: JsonImage(byteBuffer: imageFile.buffer),
          features: [
            Feature(maxResults: 10, type: AnnotationType.textDetection)
          ])
    ],
  );

  for (var textAnnotation
      in annotatedResponses.responses.first.textAnnotations) {
    print(textAnnotation.description);

    print(textAnnotation.boundingPoly!.vertices);
  }
}
