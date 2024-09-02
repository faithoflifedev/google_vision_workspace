import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';

/// Integrates Google Vision features, including painter labeling, face, logo,
/// and landmark detection, optical character recognition (OCR), and detection
/// of explicit content, into applications.
class GoogleVision {
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

  factory GoogleVision() => _instance;

  void setAuthHeader() {
    if (_token != null) {
      dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
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
    final googleVision = GoogleVision();

    googleVision.tokenGenerator = generator;

    await googleVision.confirmToken();

    return googleVision;
  }

  /// Authenticated with JWT.
  Future<GoogleVision> withJwt(
    String credentials, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    GoogleVision googleVision = GoogleVision();

    googleVision.tokenGenerator = JwtGenerator(
      credentials: credentials,
      scope: scope,
      dio: googleVision.dio,
    );

    await googleVision.confirmToken();

    return googleVision;
  }

  /// Authenticated with JWT.
  Future<GoogleVision> withJwtFile(
    String credentialsFileName, [
    String scope = 'https://www.googleapis.com/auth/cloud-platform',
  ]) async {
    GoogleVision googleVision = GoogleVision();

    googleVision.tokenGenerator = JwtGenerator.fromFile(
      credentialsFile: credentialsFileName,
      scope: scope,
      dio: googleVision.dio,
    );

    await googleVision.confirmToken();

    return googleVision;
  }

  @Deprecated('Use [GoogleVisionImage.annotate] instead.')
  Future<AnnotatedResponses> annotate({
    required AnnotateImageRequests requests,
    String? parent,
  }) async {
    final batchAnnotateImagesResponse = await image.annotate(
      requests: requests.requests,
      parent: parent,
    );

    return AnnotatedResponses(responses: batchAnnotateImagesResponse.responses);
  }

  /// Higher level method for a single detection type as specified by [annotationType],
  @Deprecated('Use [GoogleVisionImage.detection] instead.')
  Future<AnnotateImageResponse> detection(
    JsonImage jsonImage,
    AnnotationType annotationType, {
    int maxResults = 10,
  }) async {
    final annotatedResponses = await image.annotate(
      requests: [
        AnnotateImageRequest(
          jsonImage: jsonImage,
          features: [
            Feature(
              maxResults: maxResults,
              type: annotationType,
            ),
          ],
        )
      ],
    );

    return annotatedResponses.responses.first;
  }

  /// Crop Hints suggests vertices for a crop region on an image.
  @Deprecated('Use [GoogleVisionImage.cropHints] instead.')
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

  /// Extracts text from an image (or file); the response is optimized for dense
  /// text and documents. The JSON includes page, block, paragraph, word, and
  /// break information.  A specific use of [documentTextDetection] is to detect
  /// handwriting in an image.
  @Deprecated('Use [GoogleVisionImage.documentTextDetection] instead.')
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

  /// Face Detection detects multiple faces within an image along with the
  /// associated key facial attributes such as emotional state or wearing
  /// head-wear.
  @Deprecated('Use [GoogleVisionImage.faceDetection] instead.')
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

  /// The Image Properties feature detects general attributes of the image, such
  /// as dominant color.
  @Deprecated('Use [GoogleVisionImage.imageProperties] instead.')
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

  /// Labels can identify general objects, locations, activities, animal
  /// species, products, and more.  Labels are returned in English only.
  @Deprecated('Use [GoogleVisionImage.labelDetection] instead.')
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

  /// Landmark Detection detects popular natural and human-made structures
  /// within an image.
  @Deprecated('Use [GoogleVisionImage.landmarkDetection] instead.')
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

  /// Logo Detection detects popular product logos within an image.
  @Deprecated('Use [GoogleVisionImage.logoDetection] instead.')
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

  /// The Vision API can detect and extract multiple objects in an image with
  /// Object Localization.
  ///
  /// Object localization identifies multiple objects in an image and provides a
  /// [LocalizedObjectAnnotation] for each object in the image. Each
  /// [LocalizedObjectAnnotation] identifies information about the object, the
  /// position of the object, and rectangular bounds for the region of the image
  /// that contains the object.
  ///
  /// Object localization identifies both significant and less-prominent objects in an image.
  @Deprecated('Use [GoogleVisionImage.objectLocalization] instead.')
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
  @Deprecated('Use [GoogleVisionImage.productSearch] instead.')
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

  /// SafeSearch Detection detects explicit content such as adult content or
  /// violent content within an image. This feature uses five categories (adult,
  /// spoof, medical, violence, and racy) and returns the likelihood that each
  /// is present in a given image. See the SafeSearchAnnotation page for details
  /// on these fields.
  @Deprecated('Use [GoogleVisionImage.safeSearchDetection] instead.')
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

  /// Detects and extracts text from any image. For example, a photograph might
  /// contain a street sign or traffic sign. The JSON includes the entire
  /// extracted string, as well as individual words, and their bounding boxes.
  @Deprecated('Use [GoogleVisionImage.textDetection] instead.')
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

  /// Web Detection detects Web references to an image.
  @Deprecated('Use [GoogleVisionImage.webDetection] instead.')
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
