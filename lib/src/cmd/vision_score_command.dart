import 'dart:convert';

import 'package:google_vision/src/cmd/vision_helper_command.dart';

class VisionScoreCommand extends VisionHelper {
  @override
  String get name => 'score';

  @override
  String get description =>
      'For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for".';

  VisionScoreCommand() {
    argParser
      ..addOption('image-file',
          mandatory: true,
          valueHelp: 'image file path',
          help: 'The path to the file that will be processed.')
      ..addOption('features',
          mandatory: true,
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
    final annotatedResponses = await annotate();

    final scores = <double>[];

    if (argResults?['look-for'] != null) {
      for (var annotatedResponse in annotatedResponses.responses) {
        annotatedResponse.localizedObjectAnnotations
            .where((localizedObjectAnnotation) =>
                localizedObjectAnnotation.name == argResults!['look-for'])
            .toList()
            .forEach((localizedObjectAnnotation) =>
                scores.add(localizedObjectAnnotation.score));
      }
    } else {
      for (var annotatedResponse in annotatedResponses.responses) {
        scores.addAll(annotatedResponse.faceAnnotations
            .map((faceAnnotation) => faceAnnotation.detectionConfidence)
            .toList());
      }
    }

    print(json.encode(scores));
  }
}
