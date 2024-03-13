import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  final entityAnnotations = await googleVision.labelDetection(
      JsonImage.fromGsUri(
          'gs://cloud-samples-data/vision/label/setagaya.jpeg'));

  for (var entityAnnotation in entityAnnotations) {
    print('Description: - ${entityAnnotation.description}');

    print('Score: - ${entityAnnotation.boundingPoly?.normalizedVertices}');
  }

  print('done.');
}
