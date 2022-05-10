import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main(List<String> arguments) async {
  CommandRunner('vision', 'A command line interface for controlling OBS.')
    ..argParser.addOption('credential-file',
        mandatory: true, valueHelp: 'json file path', help: 'TBD')
    ..addCommand(DetectCommand())
    ..addCommand(ScoreCommand())
    ..addCommand(HighlightCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}

extension UsageExtension on DioError {
  String get usage {
    return response?.data['error']['errors'] == null
        ? message
        : response!.data['error']['errors'].toString();
  }
}

abstract class VisionHelper extends Command {
  Future<AnnotatedResponses> annotate([String? features]) async {
    final _googleVision = await GoogleVision.withJwt(
        globalResults!['credential-file'],
        'https://www.googleapis.com/auth/cloud-vision');

    final _image = Image.fromFilePath(argResults!['image-file']);

    final _features = (features ?? (argResults!['features'] as String))
        .split(',')
        .map((element) => Feature(
            maxResults: int.parse(argResults!['max-results']), type: element))
        .toList();

    final _requests = AnnotationRequests(
        requests: [AnnotationRequest(image: _image, features: _features)]);

    return await _googleVision.annotate(requests: _requests);
  }
}

///Integrates Google Vision features, including image labeling, face, logo, and
///landmark detection, optical character recognition (OCR), and detection of
///explicit content, into applications.
class DetectCommand extends VisionHelper {
  @override
  String get name => 'detect';

  @override
  String get description =>
      'Integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.';

  DetectCommand() {
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
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.');
  }

  @override
  void run() async {
    final annotatedResponses = await annotate();

    print(annotatedResponses.responses);
  }
}

class ScoreCommand extends VisionHelper {
  @override
  String get name => 'score';

  @override
  String get description =>
      'For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for"';

  ScoreCommand() {
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
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.');
  }

  @override
  void run() async {
    final annotatedResponses = await annotate();

    final _scores = <double>[];

    if (argResults?['look-for'] != null) {
      for (var annotatedResponse in annotatedResponses.responses) {
        annotatedResponse.localizedObjectAnnotations
            .where((localizedObjectAnnotation) =>
                localizedObjectAnnotation.name == argResults!['look-for'])
            .toList()
            .forEach((localizedObjectAnnotation) =>
                _scores.add(localizedObjectAnnotation.score));
      }
    } else {
      for (var annotatedResponse in annotatedResponses.responses) {
        _scores.addAll(annotatedResponse.faceAnnotations
            .map((faceAnnotation) => faceAnnotation.detectionConfidence)
            .toList());
      }
    }

    print(json.encode(_scores));
  }
}

class HighlightCommand extends VisionHelper {
  @override
  String get name => 'highlight';

  @override
  String get description => '';

  HighlightCommand() {
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
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.');
  }

  @override
  void run() async {
    try {
      final annotatedResponses = await annotate();

      final _image = Image.fromFilePath(argResults!['image-file']);

      //check for faces
      for (var annotatedResponse in annotatedResponses.responses) {
        for (var faceAnnotation in annotatedResponse.faceAnnotations) {
          GoogleVision.drawText(
              _image,
              faceAnnotation.boundingPoly.vertices.first.x + 2,
              faceAnnotation.boundingPoly.vertices.first.y * _image.height + 2,
              'Face - ${faceAnnotation.detectionConfidence}');
          GoogleVision.drawAnnotations(
              _image, faceAnnotation.boundingPoly.vertices);
        }
      }

      //check for people
      for (var annotatedResponse in annotatedResponses.responses) {
        for (var localizedObjectAnnotation
            in annotatedResponse.localizedObjectAnnotations) {
          GoogleVision.drawText(
              _image,
              (localizedObjectAnnotation
                          .boundingPoly.normalizedVertices.first.x *
                      _image.width)
                  .toInt(),
              (localizedObjectAnnotation
                              .boundingPoly.normalizedVertices.first.y *
                          _image.height)
                      .toInt() -
                  16,
              '${localizedObjectAnnotation.name} - ${localizedObjectAnnotation.score}');

          GoogleVision.drawAnnotationsNormalized(_image,
              localizedObjectAnnotation.boundingPoly.normalizedVertices);
        }
      }
      await _image.writeAsJpeg(argResults!['output-file']);
    } on DioError catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
