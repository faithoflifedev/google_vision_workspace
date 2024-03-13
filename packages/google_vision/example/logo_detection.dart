import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  final logoAnnotationsResponses = await googleVision
      .logoDetection(JsonImage.fromFilePath('sample_image/logo.png'));

  for (var logoAnnotation in logoAnnotationsResponses) {
    print('Logo: ${logoAnnotation.description}');

    print(logoAnnotation.boundingPoly?.vertices);
  }

  print('done.');
}
