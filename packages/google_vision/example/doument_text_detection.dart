import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision()
      .withJwt(File('service_credentials.json').readAsStringSync());

  final inputImage = await File('sample_image/census2010.jpg').readAsBytes();

  print('checking...');

  final fullTextAnnotation = await googleVision.image
      .documentTextDetection(JsonImage.fromBuffer(inputImage.buffer));

  for (var page in fullTextAnnotation!.pages) {
    print('Page Language: ${page.property?.detectedLanguages}');

    // print(logoAnnotation.boundingPoly?.vertices);
  }

  print('done.');
}
