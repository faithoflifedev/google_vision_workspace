import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision()
      .withJwt(File('service_credentials.json').readAsStringSync());

  print('checking...');

  const int page = 1;

  const fileName = 'sample_image/allswell.pdf';

  final file = File(fileName);

  final annotateFileResponses = await googleVision.file.documentTextDetection(
    InputConfig.fromBuffer(file.readAsBytesSync().buffer),
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
