import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

extension UsageExtension on DioError {
  String get usage {
    return response?.data['error']['errors'] == null
        ? message
        : response!.data['error']['errors'].toString();
  }
}

abstract class VisionHelper extends Command {
  GoogleVision? _googleVision;

  GoogleVision get googleVision => _googleVision!;

  Future<void> initializeGoogleVision() async {
    _googleVision =
        await GoogleVision.withJwt(globalResults!['credential-file']);
  }

  Future<AnnotatedResponses> annotate([String? features]) async {
    final googleVision = await GoogleVision.withJwt(
        globalResults!['credential-file'],
        'https://www.googleapis.com/auth/cloud-vision');

    final image = Image.fromFilePath(argResults!['image-file']);

    final featureList = (features ?? (argResults!['features'] as String))
        .split(',')
        .map((element) => Feature(
            maxResults: int.parse(argResults!['max-results']), type: element))
        .toList();

    final requests = AnnotationRequests(
        requests: [AnnotationRequest(image: image, features: featureList)]);

    return await googleVision.annotate(requests: requests);
  }
}
