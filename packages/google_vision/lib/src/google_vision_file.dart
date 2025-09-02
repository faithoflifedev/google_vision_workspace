import 'package:google_vision/google_vision.dart';

class GoogleVisionFile {
  final GoogleVision googleVision;
  final FilesClient client;

  GoogleVisionFile(this.googleVision, this.client);

  /// Run detection and annotation for a batch of requests.
  Future<BatchAnnotateFilesResponse> annotate({
    required List<AnnotateFileRequest> requests,
    String? parent,
  }) {
    googleVision.setAuthHeader();

    final jsonRequest = <String, dynamic>{'requests': requests};

    if (parent != null) {
      jsonRequest['parent'] = parent;
    }

    return client.annotate(GoogleVision.contentType, jsonRequest);
  }

  /// Higher level method for a single detection type as specified by [annotationType],
  Future<List<AnnotateFileResponse>> detection(
    InputConfig inputConfig,
    AnnotationType annotationType, {
    ImageContext? imageContext,
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final batchAnnotateFilesResponse = await annotate(
      requests: [
        AnnotateFileRequest(
          inputConfig: inputConfig,
          features: [Feature(type: annotationType, maxResults: maxResults)],
          imageContext: imageContext,
          pages: pages,
        ),
      ],
      parent: parent,
    );

    return batchAnnotateFilesResponse.responses;
  }

  /// Crop Hints suggests vertices for a crop region on an image.
  Future<List<AnnotateFileResponse>> cropHints(
    InputConfig inputConfig, {
    ImageContext? imageContext,
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotatedFileResponses = await detection(
      inputConfig,
      AnnotationType.cropHints,
      imageContext: imageContext,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotatedFileResponses;
  }

  /// Extracts text from an image (or file); the response is optimized for dense
  /// text and documents. The JSON includes page, block, paragraph, word, and
  /// break information.  A specific use of [documentTextDetection] is to detect
  /// handwriting in an image.
  Future<List<AnnotateFileResponse>> documentTextDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.documentTextDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Face Detection detects multiple faces within an image along with the
  /// associated key facial attributes such as emotional state or wearing
  /// head-wear.
  Future<List<AnnotateFileResponse>> faceDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.faceDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// The Image Properties feature detects general attributes of the image, such
  /// as dominant color.
  Future<List<AnnotateFileResponse>> imageProperties(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.imageProperties,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Labels can identify general objects, locations, activities, animal
  /// species, products, and more.  Labels are returned in English only.
  Future<List<AnnotateFileResponse>> labelDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.labelDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Landmark Detection detects popular natural and human-made structures
  /// within an image.
  Future<List<AnnotateFileResponse>> landmarkDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.landmarkDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Logo Detection detects popular product logos within an image.
  Future<List<AnnotateFileResponse>> logoDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.logoDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
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
  Future<List<AnnotateFileResponse>> objectLocalization(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.objectLocalization,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Run Product Search.
  Future<List<AnnotateFileResponse>> productSearch(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.productSearch,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// SafeSearch Detection detects explicit content such as adult content or
  /// violent content within an image. This feature uses five categories (adult,
  /// spoof, medical, violence, and racy) and returns the likelihood that each
  /// is present in a given image. See the SafeSearchAnnotation page for details
  /// on these fields.
  Future<List<AnnotateFileResponse>> safeSearchDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.safeSearchDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Detects and extracts text from any image. For example, a photograph might
  /// contain a street sign or traffic sign. The JSON includes the entire
  /// extracted string, as well as individual words, and their bounding boxes.
  Future<List<AnnotateFileResponse>> textDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.textDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }

  /// Web Detection detects Web references to an image.
  Future<List<AnnotateFileResponse>> webDetection(
    InputConfig inputConfig, {
    int maxResults = 10,
    List<int>? pages,
    String? parent,
  }) async {
    final annotateFileResponse = await detection(
      inputConfig,
      AnnotationType.webDetection,
      maxResults: maxResults,
      pages: pages,
      parent: parent,
    );

    return annotateFileResponse;
  }
}
