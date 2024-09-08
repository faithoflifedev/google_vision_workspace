import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision/google_vision_cli.dart';

/// SafeSearch Detection detects explicit content such as adult content or
/// violent content within an image.
class VisionSafeSearchCommand extends VisionHelper {
  @override
  String get name => 'safe_search';

  @override
  String get description =>
      'SafeSearch Detection detects explicit content such as adult content or violent content within an image.  This command does not work with some multi-page or multi-frame files like TIFFs and PDFs.';

  /// SafeSearch Detection detects explicit content such as adult content or
  /// violent content within an image.
  VisionSafeSearchCommand() {
    argParser.addOption('image-file',
        mandatory: true,
        valueHelp: 'image file path',
        help: 'The path to the file that will be processed.');
  }

  @override
  void run() async {
    try {
      await initializeGoogleVision();

      final safeSearchDetection = await googleVision.image
          .safeSearchDetection(JsonImage.fromBuffer(imageBytes.buffer));

      print(safeSearchDetection);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
