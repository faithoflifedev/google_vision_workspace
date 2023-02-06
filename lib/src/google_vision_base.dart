import 'package:color/color.dart';
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
  static final contentType = 'application/json';

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
      [String scope = 'https://www.googleapis.com/auth/cloud-vision']) async {
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

  /// Run painter detection and annotation for a batch of painters.
  Future<AnnotatedResponses> annotate({required AnnotationRequests requests}) =>
      _rest.annotate(_authHeader, contentType, requests.toJson());

  /// Draw a box on the supplied [Painter] around detected object using
  /// [NormalizedVertex] values.
  static void drawAnnotationsNormalized(
      Painter painter, List<NormalizedVertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      painter.drawLine(
          (vStart.x * painter.width).toInt(),
          (vStart.y * painter.height).toInt(),
          (vStop.x * painter.width).toInt(),
          (vStop.y * painter.height).toInt(),
          RgbColor.name(color),
          thickness: thickness);
    }

    painter.drawLine(
        (vertices.last.x * painter.width).toInt(),
        (vertices.last.y * painter.height).toInt(),
        (vertices.first.x * painter.width).toInt(),
        (vertices.first.y * painter.height).toInt(),
        RgbColor.name(color),
        thickness: thickness);
  }

  /// Draw a box on the supplied [Painter] around the detected object using
  /// [Vertex] values.
  static void drawAnnotations(Painter painter, List<Vertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      painter.drawLine(
          vStart.x, vStart.y, vStop.x, vStop.y, RgbColor.name(color),
          thickness: thickness);
    }

    painter.drawLine(vertices.last.x, vertices.last.y, vertices.first.x,
        vertices.first.y, RgbColor.name(color),
        thickness: thickness);
  }

  /// Draw [text] on the [Painter] at the [x] and [y] position.
  static void drawText(Painter painter, int x, int y, String text) =>
      painter.drawString(x, y, text);
}
