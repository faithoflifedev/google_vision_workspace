import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

/// Helper method to that retrieves error message string.
extension UsageExtension on DioError {
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
        await GoogleVision.withJwt(globalResults!['credential-file']);
  }

  /// Helper methods used by most of the cli commands.
  Future<AnnotatedResponses> annotate([String? features]) async {
    final googleVision = await GoogleVision.withJwt(
        globalResults!['credential-file'],
        'https://www.googleapis.com/auth/cloud-vision');

    final painter = Painter.fromFilePath(argResults!['image-file']);

    final featureList = (features ?? (argResults!['features'] as String))
        .split(',')
        .map((element) => Feature(
            maxResults: int.parse(argResults!['max-results']), type: element))
        .toList();

    final requests = AnnotationRequests(requests: [
      AnnotationRequest(image: Image(painter: painter), features: featureList)
    ]);

    return await googleVision.annotate(requests: requests);
  }
}
