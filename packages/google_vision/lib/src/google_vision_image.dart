import 'package:google_vision/google_vision.dart';

class GoogleVisionImage {
  final GoogleVision googleVision;
  final ImagesClient client;

  GoogleVisionImage(
    this.googleVision,
    this.client,
  );

  /// Run detection and annotation for a batch of requests.
  Future<BatchAnnotateImagesResponse> annotate({
    required List<AnnotateImageRequest> requests,
    String? parent,
  }) {
    googleVision.setAuthHeader();

    final jsonRequest = <String, dynamic>{
      'requests': requests,
    };

    if (parent != null) {
      jsonRequest['parent'] = parent;
    }

    return client.annotate(
      GoogleVision.contentType,
      {'requests': requests},
    );
  }

  /// Higher level method for a single detection type as specified by [annotationType],
  Future<AnnotateImageResponse> detection(
    JsonImage jsonImage,
    AnnotationType annotationType, {
    ImageContext? imageContext,
    int maxResults = 10,
  }) async {
    final annotatedResponses = await annotate(
      requests: [
        AnnotateImageRequest(
          jsonImage: jsonImage,
          features: [
            Feature(
              maxResults: maxResults,
              type: annotationType,
            ),
          ],
          imageContext: imageContext,
        )
      ],
    );

    return annotatedResponses.responses.first;
  }

  /// Crop Hints suggests vertices for a crop region on an image.
  Future<CropHintsAnnotation?> cropHints(
    JsonImage jsonImage, {
    ImageContext? imageContext,
    int maxResults = 10,
  }) async {
    final annotatedResponses = await detection(
      jsonImage,
      AnnotationType.cropHints,
      imageContext: imageContext,
      maxResults: maxResults,
    );

    return annotatedResponses.cropHintsAnnotation;
  }

  /// Extracts text from an image (or file); the response is optimized for dense
  /// text and documents. The JSON includes page, block, paragraph, word, and
  /// break information.  A specific use of [documentTextDetection] is to detect
  /// handwriting in an image.
  Future<FullTextAnnotation?> documentTextDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<List<FaceAnnotation>> faceDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<ImagePropertiesAnnotation?> imageProperties(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<List<EntityAnnotation>> labelDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<List<EntityAnnotation>> landmarkDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<List<EntityAnnotation>> logoDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<List<LocalizedObjectAnnotation>> objectLocalization(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
    ImageContext? imageContext,
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
  Future<SafeSearchAnnotation?> safeSearchDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<List<EntityAnnotation>> textDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
  Future<WebDetection?> webDetection(
    JsonImage jsonImage, {
    ImageContext? imageContext,
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
