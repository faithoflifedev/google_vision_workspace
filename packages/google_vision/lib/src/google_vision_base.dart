import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

/// Integrates Google Vision features, including painter labeling, face, logo,
/// and landmark detection, optical character recognition (OCR), and detection
/// of explicit content, into applications.
class GoogleVision {
  final VisionClient _rest;

  static final dio = Dio();
  static final DateTime tokenExpiry = DateTime(2010, 0, 0);
  static final accept = 'application/json';
  static final contentType = 'application/json; charset=UTF-8';

  static TokenGenerator? tokenGenerator;
  static String? _token;

  GoogleVision() : _rest = VisionClient(dio);

  static Future<void> _confirmToken() async {
    if (tokenGenerator == null) {
      throw Exception();
    } else {
      if (tokenExpiry.isBefore(DateTime.now())) {
        final tokenData = await tokenGenerator!.generate();

        _token = tokenData.accessToken;

        tokenExpiry.add(Duration(seconds: tokenData.expiresIn));
      }
    }
  }

  static Future<GoogleVision> withGenerator(TokenGenerator generator) async {
    final yt = GoogleVision();

    GoogleVision.tokenGenerator = generator;

    await _confirmToken();

    return yt;
  }

  /// Authenticated with JWT.
  static Future<GoogleVision> withJwt(String credentials,
      [String scope = 'https://www.googleapis.com/auth/cloud-platform']) async {
    GoogleVision yt = GoogleVision();

    tokenGenerator =
        JwtGenerator(credentials: credentials, scope: scope, dio: dio);

    await _confirmToken();

    return yt;
  }

  /// Authenticated with JWT.
  static Future<GoogleVision> withJwtFile(String credentialsFileName,
      [String scope = 'https://www.googleapis.com/auth/cloud-platform']) async {
    GoogleVision yt = GoogleVision();

    tokenGenerator = JwtGenerator.fromFile(
        credentialsFile: credentialsFileName, scope: scope, dio: dio);

    await _confirmToken();

    return yt;
  }

  /// Run detection and annotation for a batch of requests.
  Future<AnnotatedResponses> annotate({required AnnotationRequests requests}) =>
      _rest.annotate(
        'Bearer $_token',
        contentType,
        requests.toJson(),
      );
}
