import 'package:color/color.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

///Integrates Google Vision features, including image labeling, face, logo, and
///landmark detection, optical character recognition (OCR), and detection of
///explicit content, into applications.
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

  ///authenticated with JWT
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

  ///Run image detection and annotation for a batch of images.
  Future<AnnotatedResponses> annotate({required AnnotationRequests requests}) {
    return _rest.annotate(_authHeader, contentType, requests.toJson());
  }

  ///draw a box on the supplied [Image] around detected object using [NormalizedVertex] values
  static void drawAnnotationsNormalized(
      Image image, List<NormalizedVertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      image.drawLine(
          (vStart.x * image.width).toInt(),
          (vStart.y * image.height).toInt(),
          (vStop.x * image.width).toInt(),
          (vStop.y * image.height).toInt(),
          RgbColor.name(color),
          thickness: thickness);
    }

    image.drawLine(
        (vertices.last.x * image.width).toInt(),
        (vertices.last.y * image.height).toInt(),
        (vertices.first.x * image.width).toInt(),
        (vertices.first.y * image.height).toInt(),
        RgbColor.name(color),
        thickness: thickness);
  }

  ///draw a box on the supplied [Image] around the detected object using [Vertex] values
  static void drawAnnotations(Image image, List<Vertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      image.drawLine(vStart.x, vStart.y, vStop.x, vStop.y, RgbColor.name(color),
          thickness: thickness);
    }

    image.drawLine(vertices.last.x, vertices.last.y, vertices.first.x,
        vertices.first.y, RgbColor.name(color),
        thickness: thickness);
  }

  ///draw [text] on the [Image] at the [x] and [y] position
  static void drawText(Image image, int x, int y, String text) {
    image.drawString(x, y, text);
  }
}
