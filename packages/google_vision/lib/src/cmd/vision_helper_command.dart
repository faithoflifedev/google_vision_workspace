import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

/// Helper method to that retrieves error message string.
extension UsageExtension on DioException {
  String get usage {
    return response?.data['error']['errors'] == null
        ? message!
        : response!.data['error']['errors'].toString();
  }
}

/// Helper methods used by most of the cli commands.
abstract class VisionHelper extends Command {
  GoogleVision? _googleVision;

  GoogleVision get googleVision => _googleVision!;

  Future<void> initializeGoogleVision() async {
    _googleVision =
        await GoogleVision.withJwtFile(globalResults!['credential-file']);
  }

  /// Helper methods used by most of the cli commands.
  Future<AnnotatedResponses> annotate(ByteBuffer buffer,
      [String? features]) async {
    final featureList = (features ?? (argResults!['features'] as String))
        .split(',')
        .map(
          (element) => Feature(
              maxResults: int.parse(argResults!['max-results']),
              type: AnnotationType.values.byName(element)),
        )
        .toList();

    final requests = AnnotationRequests(requests: [
      AnnotationRequest(
        jsonImage: JsonImage(byteBuffer: buffer),
        features: featureList,
      )
    ]);

    return googleVision.annotate(requests: requests);
  }
}
