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

  String get _authHeader => 'Bearer $_token';

  GoogleVision() : _rest = VisionClient(dio);

  static Future<GoogleVision> withGenerator(TokenGenerator generator) async {
    final yt = GoogleVision();

    GoogleVision.tokenGenerator = generator;

    await _confirmToken();

    return yt;
  }

  /// Authenticated with JWT.
  static Future<GoogleVision> withJwt(String credentialsFile,
      [String scope = 'https://www.googleapis.com/auth/cloud-platform']) async {
    GoogleVision yt = GoogleVision();

    tokenGenerator =
        JwtGenerator(credentialsFile: credentialsFile, scope: scope, dio: dio);

    await _confirmToken();

    return yt;
  }

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

  /// Run detection and annotation for a batch of requests.
  Future<AnnotatedResponses> annotate({required AnnotationRequests requests}) =>
      _rest.annotate(
        _authHeader,
        contentType,
        requests.toJson(),
      );

  /// Draw a box on the supplied [Painter] around detected object using
  /// [NormalizedVertex] values.
  static void drawAnnotationsNormalized(
      Painter painter, List<NormalizedVertex> vertices,
      {String color = 'red', int thickness = 3}) {
    final topLeft = vertices.first;

    final bottomRight = vertices[2];

    painter.drawRectangle(
      (topLeft.x * painter.width).toInt(),
      (topLeft.y * painter.height).toInt(),
      (bottomRight.x * painter.width).toInt(),
      (bottomRight.y * painter.height).toInt(),
      color,
    );
  }

  /// Draw a box on the supplied [Painter] around the detected object using
  /// [Vertex] values.
  static void drawAnnotations(Painter painter, List<Vertex> vertices,
      {String color = 'red', int thickness = 3}) {
    final topLeft = vertices.first;

    final bottomRight = vertices[2];

    painter.drawRectangle(
      topLeft.x.toInt(),
      topLeft.y.toInt(),
      bottomRight.x.toInt(),
      bottomRight.y.toInt(),
      color,
    );
  }

  /// Draw [text] on the [Painter] at the [x] and [y] position.
  static void drawText(Painter painter, int x, int y, String text,
          {String color = 'red'}) =>
      painter.drawString(
        x,
        y,
        text,
        color,
      );
}
