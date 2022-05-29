import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

class VisionHighlightCommand extends VisionHelper {
  @override
  String get name => 'highlight';

  @override
  String get description => 'Draw a box to highlight any objects detected.';

  VisionHighlightCommand() {
    argParser
      ..addOption('image-file',
          mandatory: true,
          valueHelp: 'image file path',
          help: 'The path to the file that will be processed.')
      ..addOption('output-file',
          mandatory: true,
          valueHelp: 'image file path',
          help:
              'The path to the image file that will display the detected objects highlighted')
      ..addOption('features',
          help:
              'Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]')
      ..addOption('look-for',
          // mandatory: true,
          help: 'Comma separated list of Objects to provide a core for')
      ..addOption('max-results',
          defaultsTo: '10',
          valueHelp: 'int',
          help:
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.');
  }

  @override
  void run() async {
    try {
      final annotatedResponses = await annotate();

      final image = Image.fromFilePath(argResults!['image-file']);

      //check for faces
      for (var annotatedResponse in annotatedResponses.responses) {
        for (var faceAnnotation in annotatedResponse.faceAnnotations) {
          GoogleVision.drawText(
              image,
              faceAnnotation.boundingPoly.vertices.first.x + 2,
              faceAnnotation.boundingPoly.vertices.first.y * image.height + 2,
              'Face - ${faceAnnotation.detectionConfidence}');
          GoogleVision.drawAnnotations(
              image, faceAnnotation.boundingPoly.vertices);
        }
      }

      //check for people
      for (var annotatedResponse in annotatedResponses.responses) {
        for (var localizedObjectAnnotation
            in annotatedResponse.localizedObjectAnnotations) {
          GoogleVision.drawText(
              image,
              (localizedObjectAnnotation
                          .boundingPoly.normalizedVertices.first.x *
                      image.width)
                  .toInt(),
              (localizedObjectAnnotation
                              .boundingPoly.normalizedVertices.first.y *
                          image.height)
                      .toInt() -
                  16,
              '${localizedObjectAnnotation.name} - ${localizedObjectAnnotation.score}');

          GoogleVision.drawAnnotationsNormalized(
              image, localizedObjectAnnotation.boundingPoly.normalizedVertices);
        }
      }
      await image.writeAsJpeg(argResults!['output-file']);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
