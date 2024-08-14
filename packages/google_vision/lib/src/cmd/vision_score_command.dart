import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

/// For OBJECT_LOCALIZATION, get the score(s) for the object specified with
/// "look-for".
class VisionScoreCommand extends VisionHelper {
  @override
  String get name => 'score';

  @override
  String get description =>
      'For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for".';

  /// For OBJECT_LOCALIZATION, get the score(s) for the object specified with
  /// "look-for".
  VisionScoreCommand() {
    argParser
      ..addOption('image-file',
          mandatory: true,
          valueHelp: 'image file path',
          help: 'The path to the file that will be processed.')
      ..addOption('features',
          allowed: AnnotationType.values.map((e) => e.name).toList(),
          help:
              'Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]')
      ..addOption('look-for',
          // mandatory: true,
          help: 'Comma separated list of Objects to provide a score for')
      ..addOption('max-results',
          defaultsTo: '10',
          valueHelp: 'int',
          help:
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.');
  }

  @override
  void run() async {
    try {
      await initializeGoogleVision();

      final imageFile = File(argResults!['image-file']).readAsBytesSync();

      final annotatedResponses = await annotateImage(imageFile.buffer);

      final scores = <double>[];

      (argResults!['features'] as String).split(',').forEach((feature) {
        switch (AnnotationType.values.byName(feature)) {
          case AnnotationType.faceDetection:
            scores.addAll(annotatedResponses.responses.first.faceAnnotations
                .map((faceAnnotation) => faceAnnotation.detectionConfidence)
                .toList());
            break;

          case AnnotationType.landmarkDetection:
          case AnnotationType.logoDetection:
          case AnnotationType.labelDetection:
          case AnnotationType.textDetection:
          case AnnotationType.objectLocalization:
            scores.addAll(annotatedResponses.responses.first.annotations
                .map((annotation) => annotation.score!)
                .toList());
            break;

          default:
            throw UsageException(
                '${AnnotationType.values.byName(feature)} is not supported for this command.',
                usage);
        }
      });

      print(json.encode(scores));
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
