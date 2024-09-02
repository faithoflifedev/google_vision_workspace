import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

/// SafeSearch Detection detects explicit content such as adult content or
/// violent content within an image.
class VisionSafeSearchCommand extends VisionHelper {
  @override
  String get name => 'safe_search';

  @override
  String get description =>
      'SafeSearch Detection detects explicit content such as adult content or violent content within an image.';

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
    final googleVision = await GoogleVision().withJwtFile(
        globalResults!['credential-file'],
        'https://www.googleapis.com/auth/cloud-vision');

    final imageFile = File(argResults!['image-file']);

    final safeSearchDetection = await googleVision.image
        .safeSearchDetection(JsonImage.fromFile(imageFile));

    print(safeSearchDetection);
  }
}
