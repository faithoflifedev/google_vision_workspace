import 'package:google_vision/google_vision.dart';

class VisionSafeSearchCommand extends VisionHelper {
  @override
  String get name => 'safe_search';

  @override
  String get description =>
      'SafeSearch Detection detects explicit content such as adult content or violent content within an image.';

  VisionSafeSearchCommand() {
    argParser.addOption('image-file',
        mandatory: true,
        valueHelp: 'image file path',
        help: 'The path to the file that will be processed.');
  }

  @override
  void run() async {
    final googleVision = await GoogleVision.withJwt(
        globalResults!['credential-file'],
        'https://www.googleapis.com/auth/cloud-vision');

    final image = Image.fromFilePath(argResults!['image-file']);

    final requests = AnnotationRequests(requests: [
      AnnotationRequest(
        image: image,
        features: [Feature(type: 'SAFE_SEARCH_DETECTION')],
      )
    ]);

    final annotatedResponses = await googleVision.annotate(requests: requests);

    print(annotatedResponses.responses);
  }
}
