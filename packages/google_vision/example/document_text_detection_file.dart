import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  const int page = 1;

  final annotateFileResponses = await googleVision.file.documentTextDetection(
    InputConfig.fromFilePath('sample_image/allswell.pdf'),
    pages: [page],
  );

  for (var annotateFileResponse in annotateFileResponses) {
    if (annotateFileResponse.error != null) {
      print('error');
    } else {
      print('page: $page of ${annotateFileResponse.totalPages}');

      for (var annotateImageResponse in annotateFileResponse.responses!) {
        annotateImageResponse.fullTextAnnotation!.pages.first.blocks
            ?.forEach((block) {
          block.paragraphs?.forEach((paragraph) {
            stdout.write('\n');

            paragraph.words?.forEach((word) {
              var segment = word.symbols?.map((e) => e.text).join();

              stdout.write('${segment ?? ''} ');
            });
          });
        });
      }
    }
  }
}
