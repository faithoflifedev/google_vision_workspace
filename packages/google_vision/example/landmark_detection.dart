import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision().withJwtFile('service_credentials.json');

  print('checking...');

  final landmarkAnnotationsResponse = await googleVision.image
      .labelDetection(JsonImage.fromFilePath('sample_image/cn_tower.jpg'));

  for (var landmarkAnnotation in landmarkAnnotationsResponse) {
    print('score: ${landmarkAnnotation.score}');

    print('Landmark: ${landmarkAnnotation.description}');
  }

  print('done.');
}
