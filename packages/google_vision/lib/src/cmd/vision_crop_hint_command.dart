import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision/google_vision_cli.dart';

/// Set of crop hints that are used to generate new crops when serving images.
class VisionCropHintCommand extends VisionHelper {
  @override
  String get name => 'crop_hints';

  @override
  String get description =>
      'Set of crop hints that are used to generate new crops when serving images. When using this command with multi-page or multi-frame files like TIFFs and PDFs you must also provide a value for the the \'--pages\' argument.';

  /// Set of crop hints that are used to generate new crops when serving images.
  VisionCropHintCommand() {
    argParser
      ..addOption('image-file',
          mandatory: true,
          valueHelp: 'image file path',
          help: 'The path to the file that will be processed.')
      ..addOption(
        'pages',
        abbr: 'p',
        valueHelp: 'comma delimited list of pages to process (max 5)',
      )
      ..addOption('aspect-ratios',
          valueHelp: 'aspect ratios',
          help:
              'Comma delimitated list of aspect ratios in floats, representing the ratio of the width to the height of the image. For example, if the desired aspect ratio is 4/3, the corresponding float value should be 1.33333. If not specified, the best possible crop is returned. The number of provided aspect ratios is limited to a maximum of 16; any aspect ratios provided after the 16th are ignored.');
  }

  @override
  void run() async {
    try {
      await initializeGoogleVision();

      final aspectRatios = argResults?['aspect-ratios'] == null
          ? null
          : argResults!['aspect-ratios']
              .toString()
              .split(',')
              .map((aspectRatio) => double.parse(aspectRatio))
              .toList();

      final imageContext = aspectRatios != null
          ? ImageContext(
              cropHintsParams: CropHintsParams(aspectRatios: aspectRatios),
            )
          : null;

      if (pages != null) {
        final annotatedResponses = await googleVision.file.cropHints(
          InputConfig.fromBuffer(imageBytes.buffer),
          imageContext: imageContext,
          pages: pages!,
        );

        print(annotatedResponses);
      } else {
        final annotatedResponses = await googleVision.image.cropHints(
          JsonImage.fromBuffer(imageBytes.buffer),
          imageContext: imageContext,
        );

        print(annotatedResponses?.cropHints);
      }
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
