import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:loggy/loggy.dart';

/// Integrates Google Vision features, including painter labeling, face, logo,
/// and landmark detection, optical character recognition (OCR), and detection
/// of explicit content, into applications.
class GoogleVision with UiLoggy {
  static final GoogleVision _instance = GoogleVision._internal();

  final dio = Dio();
  final tokenExpiry = DateTime(2010, 0, 0);

  late final _imagesClient = ImagesClient(dio);
  late final _filesClient = FilesClient(dio);

  static const accept = 'application/json';
  static const contentType = 'application/json; charset=UTF-8';

  TokenGenerator? tokenGenerator;
  String? _apiKey;
  String? _token;

  GoogleVisionImage get image => GoogleVisionImage(this, _imagesClient);

  GoogleVisionFile get file => GoogleVisionFile(this, _filesClient);

  set apiKey(String apiKey) => _apiKey = apiKey;

  // Private constructor
  GoogleVision._internal();

  factory GoogleVision([LogLevel logLevel = LogLevel.off]) {
    if (logLevel != LogLevel.off) {
      _instance.dio.interceptors.add(
        LoggyDioInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          requestLevel: logLevel,
          responseLevel: logLevel,
          errorLevel: logLevel,
        ),
      );
    }

    Loggy.initLoggy(
      logPrinter: const PrettyPrinter(showColors: true),
      logOptions: LogOptions(logLevel),
    );

    return _instance;
  }

  /// Authenticate using an API key.
  GoogleVision withApiKey(
    String apiKey, {
    Map<String, String>? additionalHeaders,
  }) {
    this.apiKey = apiKey;

    if (additionalHeaders != null) {
      dio.options.headers.addAll(additionalHeaders);
    }

    return this;
  }

  /// Authenticate using the supplied token generator
  Future<GoogleVision> withGenerator(TokenGenerator generator) async {
    tokenGenerator = generator;

    await confirmToken();

    return this;
  }

  /// Authenticated with JWT.
  Future<GoogleVision> withJwt(
    String credentials, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    tokenGenerator = JwtGenerator(
      credentials: credentials,
      scope: scope,
      dio: dio,
    );

    await confirmToken();

    return this;
  }

  void setAuthHeader() {
    if (_token != null) {
      dio.options.headers['authorization'] = 'Bearer $_token';
    }

    if (_apiKey != null) {
      dio.options.queryParameters['key'] = _apiKey;
    }
  }

  Future<void> confirmToken() async {
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
}
