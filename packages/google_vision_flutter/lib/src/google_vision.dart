import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:universal_io/io.dart';

class GoogleVision implements gv.GoogleVision {
  static final GoogleVision _instance = GoogleVision._internal();

  final _googleVision = gv.GoogleVision();

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

  factory GoogleVision() => _instance;

  /// Create a new instance of [GoogleVision] with the given [apiKey].
  @override
  GoogleVision withApiKey(
    String apiKey, {
    Map<String, String>? additionalHeaders,
  }) {
    _googleVision.withApiKey(apiKey);

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

  @override
  Future<GoogleVision> withJwt(
    String credentials, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    await _googleVision.withJwt(credentials, scope);

    return this;
  }

  @override
  Future<GoogleVision> withGenerator(gv.TokenGenerator generator) async {
    await _googleVision.withGenerator(generator);

    return this;
  }

  @override
  Future<GoogleVision> withJwtFile(
    String credentialsFileName, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    final File file = File(credentialsFileName);

    final credentials = await file.readAsString();

    return withJwt(credentials, scope);
  }

  @override
  Future<void> confirmToken() => _googleVision.confirmToken();

  @override
  void setAuthHeader() => _googleVision.setAuthHeader();

  @override
  Future<gv.AnnotatedResponses> annotate(
          {required gv.AnnotateImageRequests requests, String? parent}) =>
      _googleVision.annotate(
        requests: requests,
        parent: parent,
      );

  @override
  Future<gv.CropHintsAnnotation?> cropHints(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.cropHints(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<gv.AnnotateImageResponse> detection(
    gv.JsonImage jsonImage,
    gv.AnnotationType annotationType, {
    int maxResults = 10,
  }) =>
      _googleVision.detection(
        jsonImage,
        annotationType,
        maxResults: maxResults,
      );

  @override
  Future<gv.FullTextAnnotation?> documentTextDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.documentTextDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<List<gv.FaceAnnotation>> faceDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.faceDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<gv.ImagePropertiesAnnotation?> imageProperties(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.imageProperties(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<List<gv.EntityAnnotation>> labelDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.labelDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<List<gv.EntityAnnotation>> landmarkDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.landmarkDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  // TODO: implement loggy
  // Loggy<UiLoggy> get loggy => throw UnimplementedError();

  @override
  Future<List<gv.EntityAnnotation>> logoDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.logoDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<List<gv.LocalizedObjectAnnotation>> objectLocalization(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.objectLocalization(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<gv.ProductSearchResults?> productSearch(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.productSearch(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<gv.SafeSearchAnnotation?> safeSearchDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.safeSearchDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<List<gv.EntityAnnotation>> textDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.textDetection(
        jsonImage,
        maxResults: maxResults,
      );

  @override
  Future<gv.WebDetection?> webDetection(
    gv.JsonImage jsonImage, {
    int maxResults = 10,
  }) =>
      _googleVision.webDetection(
        jsonImage,
        maxResults: maxResults,
      );
}
