import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';

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
      ..addOption(
        'image-file',
        mandatory: true,
        valueHelp: 'image file path',
        help: 'The path to the file that will be processed.',
      )
      ..addOption(
        'pages',
        abbr: 'p',
        valueHelp: 'comma delimited list of pages to process (max 5)',
      )
      ..addOption(
        'features',
        mandatory: true,
        help:
            'Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]',
      )
      ..addOption(
        'max-results',
        defaultsTo: '10',
        valueHelp: 'number',
        help:
            'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.',
      );
  }

  @override
  void run() async {
    try {
      await initializeGoogleVision();

      if (pages != null) {
        final annotatedResponses = await annotateFile();

        print(annotatedResponses.responses);
      } else {
        final annotatedResponses = await annotateImage();

        print(annotatedResponses.responses);
      }
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
