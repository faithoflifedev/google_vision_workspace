import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  final annotateFileResponses = await googleVision.file.documentTextDetection(
    InputConfig.fromFilePath('sample_image/allswell.pdf'),
    pages: [1],
  );

  String text = '';

  for (var annotateFileResponse in annotateFileResponses) {
    if (annotateFileResponse.error != null) {
      print('error');
    } else {
      print('pages: ${annotateFileResponse.totalPages}');
    }

    for (var annotateImageResponse in annotateFileResponse.responses!) {
      annotateImageResponse.fullTextAnnotation!.pages.first.blocks
          ?.forEach((block) {
        block.paragraphs?.forEach((paragraph) {
          paragraph.words?.forEach((word) {
            var segment = word.symbols?.map((e) => e.text).join();

            text += (segment ?? '') + ' ';
          });
        });
      });
    }
  }

  print(text);
}
