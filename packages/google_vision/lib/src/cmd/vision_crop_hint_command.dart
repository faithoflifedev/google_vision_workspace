import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

/// Set of crop hints that are used to generate new crops when serving images.
class VisionCropHintCommand extends VisionHelper {
  @override
  String get name => 'crop_hints';

  @override
  String get description =>
      'Set of crop hints that are used to generate new crops when serving images.';

  /// Set of crop hints that are used to generate new crops when serving images.
  VisionCropHintCommand() {
    argParser
      ..addOption('image-file',
          mandatory: true,
          valueHelp: 'image file path',
          help: 'The path to the file that will be processed.')
      ..addOption('aspect-ratios',
          valueHelp: 'aspect ratios',
          help:
              'Comma delimitated list of aspect ratios in floats, representing the ratio of the width to the height of the image. For example, if the desired aspect ratio is 4/3, the corresponding float value should be 1.33333. If not specified, the best possible crop is returned. The number of provided aspect ratios is limited to a maximum of 16; any aspect ratios provided after the 16th are ignored.');
  }

  @override
  void run() async {
    final googleVision = await GoogleVision.withJwtFile(
        globalResults!['credential-file'],
        'https://www.googleapis.com/auth/cloud-vision');

    final imageFile = File(argResults!['image-file']);

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
      final annotatedResponses = await annotateFile(
        imageFile,
        imageContext: imageContext,
        pages: pages!,
      );

      print(annotatedResponses.responses);
    } else {
      final annotatedResponses = await googleVision.image.cropHints(
        JsonImage.fromFile(imageFile),
        imageContext: imageContext,
      );

      print(annotatedResponses?.cropHints);
    }
  }
}
