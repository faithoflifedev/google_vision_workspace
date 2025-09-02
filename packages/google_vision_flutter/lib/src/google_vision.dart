import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:loggy/loggy.dart';

/// Integrates Google Vision features, including painter labeling, face, logo,
/// and landmark detection, optical character recognition (OCR), and detection
/// of explicit content, into applications.
class GoogleVision with UiLoggy implements gv.GoogleVision {
  static final GoogleVision _instance = GoogleVision._internal();

  late final gv.GoogleVision _googleVision;

  @override
  gv.TokenGenerator? tokenGenerator;

  @override
  Dio get dio => _googleVision.dio;

  @override
  get file => _googleVision.file;

  @override
  get image => _googleVision.image;

  @override
  set apiKey(String apiKey) => _googleVision.apiKey = apiKey;

  @override
  get tokenExpiry => _googleVision.tokenExpiry;

  // Private constructor
  GoogleVision._internal();

  factory GoogleVision([LogLevel logLevel = LogLevel.off]) {
    _instance._googleVision = gv.GoogleVision(logLevel);

    return _instance;
  }

  /// Create a new instance of [GoogleVision] with the given [apiKey].
  @override
  GoogleVision withApiKey(
    String apiKey, {
    Map<String, String>? additionalHeaders,
  }) {
    _googleVision.withApiKey(apiKey, additionalHeaders: additionalHeaders);

    return this;
  }

  /// Create a new instance of [GoogleVision] with the given [assetFileName].
  Future<GoogleVision> withAsset(
    String assetFileName, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    final credentials = await rootBundle.loadString(assetFileName);

    return withJwt(credentials, scope);
  }

  /// Authenticated with JWT.
  @override
  Future<GoogleVision> withJwt(
    String credentials, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    await _googleVision.withJwt(credentials, scope);

    return this;
  }

  /// Authenticate using the supplied token generator
  @override
  Future<GoogleVision> withGenerator(gv.TokenGenerator generator) async {
    await _googleVision.withGenerator(generator);

    return this;
  }

  @override
  Future<void> confirmToken() => _googleVision.confirmToken();

  @override
  void setAuthHeader() => _googleVision.setAuthHeader();

  @override
  Loggy<UiLoggy> get loggy => _googleVision.loggy;
}
