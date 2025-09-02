import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision().withJwt(
    File('service_credentials.json').readAsStringSync(),
  );

  final inputImage = await File('sample_image/cn_tower.jpg').readAsBytes();

  print('checking...');

  final landmarkAnnotationsResponse = await googleVision.image.labelDetection(
    JsonImage.fromBuffer(inputImage.buffer),
  );

  for (var landmarkAnnotation in landmarkAnnotationsResponse) {
    print('score: ${landmarkAnnotation.score}');

    print('Landmark: ${landmarkAnnotation.description}');
  }

  print('done.');
}
