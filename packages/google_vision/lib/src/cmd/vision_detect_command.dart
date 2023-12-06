import 'package:universal_io/io.dart';

import 'vision_helper_command.dart';

///Integrates Google Vision features, including image labeling, face, logo, and
///landmark detection, optical character recognition (OCR), and detection of
///explicit content, into applications.
class VisionDetectCommand extends VisionHelper {
  @override
  String get name => 'detect';

  @override
  String get description => 'Run image detection and annotation for images.';

  /// Run image detection and annotation for images.
  VisionDetectCommand() {
    argParser
      ..addOption('image-file',
          mandatory: true,
          valueHelp: 'image file path',
          help: 'The path to the file that will be processed.')
      ..addOption('features',
          mandatory: true,
          help:
              'Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]')
      ..addOption('max-results',
          defaultsTo: '10',
          valueHelp: 'number',
          help:
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.');
  }

  @override
  void run() async {
    final imageFile = File(argResults!['image-file']).readAsBytesSync();

    final annotatedResponses = await annotate(imageFile.buffer);

    print(annotatedResponses.responses);
  }
}
