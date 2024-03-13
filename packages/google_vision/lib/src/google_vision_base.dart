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

  /// Authenticate using the supplied token  generator
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

  /// Higher level method for a single detection type as specified by [annotationType],
  Future<AnnotateImageResponse> detection(
    JsonImage jsonImage,
    AnnotationType annotationType, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await annotate(
      requests: AnnotationRequests(
        requests: [
          AnnotationRequest(jsonImage: jsonImage, features: [
            Feature(maxResults: maxResults, type: annotationType),
          ])
        ],
      ),
    );

    return annotatedResponses.responses.first;
  }

  /// Run crop hints.
  Future<CropHintsAnnotation?> cropHints(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.cropHints,
      maxResults: maxResults,
    );

    return annotatedResponses.cropHintsAnnotation;
  }

  /// Run dense text document OCR. Takes precedence when both
  /// DOCUMENT_TEXT_DETECTION and TEXT_DETECTION are present.
  Future<FullTextAnnotation?> documentTextDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.documentTextDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.fullTextAnnotation;
  }

  /// Run face detection.
  Future<List<FaceAnnotation>> faceDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.faceDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.faceAnnotations;
  }

  /// Compute a set of image properties, such as the image's dominant colors.
  Future<ImagePropertiesAnnotation?> imageProperties(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.imageProperties,
      maxResults: maxResults,
    );

    return annotatedResponses.imagePropertiesAnnotation;
  }

  /// Run label detection.
  Future<List<EntityAnnotation>> labelDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.labelDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.labelAnnotations;
  }

  /// Run landmark detection.
  Future<List<EntityAnnotation>> landmarkDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.landmarkDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.landmarkAnnotations;
  }

  /// Run logo detection.
  Future<List<EntityAnnotation>> logoDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.logoDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.logoAnnotations;
  }

  /// Run localizer for object detection.
  Future<List<LocalizedObjectAnnotation>> objectLocalization(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.objectLocalization,
      maxResults: maxResults,
    );

    return annotatedResponses.localizedObjectAnnotations;
  }

  /// Run Product Search.
  Future<ProductSearchResults?> productSearch(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.productSearch,
      maxResults: maxResults,
    );

    return annotatedResponses.productSearchResults;
  }

  /// Run Safe Search to detect potentially unsafe or undesirable content.
  Future<SafeSearchAnnotation?> safeSearchDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.safeSearchDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.safeSearchAnnotation;
  }

  /// Run text detection / optical character recognition (OCR). Text detection
  /// is optimized for areas of text within a larger image; if the image is a
  /// document, use DOCUMENT_TEXT_DETECTION instead.
  Future<List<EntityAnnotation>> textDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.textDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.textAnnotations;
  }

  /// Run web detection.
  Future<WebDetection?> webDetection(
    JsonImage jsonImage, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.webDetection,
      maxResults: maxResults,
    );

    return annotatedResponses.webDetection;
  }
}
