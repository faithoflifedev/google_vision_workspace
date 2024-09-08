import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision()
      .withJwt(File('service_credentials.json').readAsStringSync());

  final inputImage = await File('sample_image/logo.png').readAsBytes();

  print('checking...');

  final logoAnnotationsResponses = await googleVision.image
      .logoDetection(JsonImage.fromBuffer(inputImage.buffer));

  for (var logoAnnotation in logoAnnotationsResponses) {
    print('Logo: ${logoAnnotation.description}');

    print(logoAnnotation.boundingPoly?.vertices);
  }

  print('done.');
}
