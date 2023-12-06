import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:image/image.dart' as img;
import 'package:universal_io/io.dart';

/// Draw a box to highlight any objects detected.
class VisionHighlightCommand extends VisionHelper {
  @override
  String get name => 'highlight';

  @override
  String get description => 'Draw a box to highlight any objects detected.';

  /// Draw a box to highlight any objects detected.
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
      ..addOption('line-color',
          valueHelp: 'String',
          allowed: Util.colorMap.keys.toList(),
          defaultsTo: 'red',
          help:
              'The path to the image file that will display the detected objects highlighted')
      ..addOption('features',
          allowed: AnnotationType.values.map((e) => e.name).toList(),
          help:
              'Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]')
      ..addOption('max-results',
          defaultsTo: '10',
          valueHelp: 'int',
          help:
              'The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive.');
  }

  /// Draw a box on the supplied [img.Image] represented by [ByteData] around
  /// the detected object using [Vertex] values.
  void drawAnnotations({
    required img.Image image,
    required List<Vertex> vertices,
    required img.Color color,
    int thickness = 3,
    bool isNormalized = false,
  }) {
    final topLeft = vertices.first;

    final bottomRight = vertices[2];

    img.drawRect(
      image,
      x1: isNormalized ? (topLeft.x * image.width).toInt() : topLeft.x.toInt(),
      y1: isNormalized ? (topLeft.y * image.height).toInt() : topLeft.y.toInt(),
      x2: isNormalized
          ? (bottomRight.x * image.width).toInt()
          : bottomRight.x.toInt(),
      y2: isNormalized
          ? (bottomRight.y * image.height).toInt()
          : bottomRight.y.toInt(),
      color: Util.convertColorNameToImageColor(argResults!['line-color']),
      thickness: thickness,
    );
  }

  @override
  void run() async {
    try {
      await initializeGoogleVision();

      final Uint8List encodedBytes =
          File(argResults!['image-file']).readAsBytesSync();

      final annotatedResponses = await annotate(encodedBytes.buffer);

      final img.Image decodedBytes = img.decodeImage(encodedBytes)!;

      for (var annotatedResponse in annotatedResponses.responses) {
        // check for faces
        for (var faceAnnotation in annotatedResponse.faceAnnotations) {
          img.drawString(
            decodedBytes,
            'Face - ${faceAnnotation.detectionConfidence}',
            font: img.arial14,
            x: faceAnnotation.boundingPoly.vertices.first.x + 2,
            y: faceAnnotation.boundingPoly.vertices.first.y *
                    decodedBytes.height +
                2,
            color: Util.convertColorNameToImageColor(argResults!['line-color']),
          );

          drawAnnotations(
            vertices: faceAnnotation.boundingPoly.vertices,
            image: decodedBytes,
            color: Util.convertColorNameToImageColor(argResults!['line-color']),
          );
        }

        var textOffset = 0;

        // check for landmarks
        for (var landmarkAnnotation in annotatedResponse.landmarkAnnotations) {
          img.drawString(
            decodedBytes,
            '${landmarkAnnotation.description} - ${landmarkAnnotation.score}',
            font: img.arial14,
            x: landmarkAnnotation.boundingPoly!.vertices.first.x + 4,
            y: landmarkAnnotation.boundingPoly!.vertices.first.y *
                    decodedBytes.height +
                4 +
                textOffset,
            color: Util.convertColorNameToImageColor(argResults!['line-color']),
          );

          // move the text down a bit
          textOffset += 16;

          drawAnnotations(
            vertices: landmarkAnnotation.boundingPoly!.vertices,
            image: decodedBytes,
            color: Util.convertColorNameToImageColor(argResults!['line-color']),
          );
        }

        // check for objects
        for (var localizedObjectAnnotation
            in annotatedResponse.localizedObjectAnnotations) {
          img.drawString(
            decodedBytes,
            '${localizedObjectAnnotation.name} - ${localizedObjectAnnotation.score}',
            font: img.arial14,
            x: (localizedObjectAnnotation
                        .boundingPoly!.normalizedVertices.first.x *
                    decodedBytes.width)
                .toInt(),
            y: (localizedObjectAnnotation
                            .boundingPoly!.normalizedVertices.first.y *
                        decodedBytes.height)
                    .toInt() -
                16,
            color: Util.convertColorNameToImageColor(argResults!['line-color']),
          );

          drawAnnotations(
              vertices: localizedObjectAnnotation.boundingPoly!.vertices,
              image: decodedBytes,
              color:
                  Util.convertColorNameToImageColor(argResults!['line-color']),
              isNormalized: true);
        }
      }

      await img.encodeJpgFile(argResults!['output-file'], decodedBytes);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
