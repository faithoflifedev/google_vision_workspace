import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  final fullTextAnnotation = await googleVision.documentTextDetection(
      JsonImage.fromFilePath('sample_image/census2010.jpg'));

  for (var page in fullTextAnnotation!.pages) {
    print('Page Language: ${page.property?.detectedLanguages}');

    // print(logoAnnotation.boundingPoly?.vertices);
  }

  print('done.');
}
