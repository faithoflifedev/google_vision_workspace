import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:retrofit/retrofit.dart';

part 'images.g.dart';

/// Integrates Google Vision features, including image labeling, face, logo, and
/// landmark detection, optical character recognition (OCR), and detection of
/// explicit content, into applications.
@RestApi(baseUrl: 'https://vision.googleapis.com/v1')
abstract class ImagesClient {
  factory ImagesClient(Dio dio, {String baseUrl}) = _ImagesClient;

  /// Run image detection and annotation for a batch of images.

  @POST('/images:annotate')
  Future<BatchAnnotateImagesResponse> annotate(
      @Header('Content-Type') String contentType,
      // @Header('x-goog-user-project') String? projectId,
      @Body() Map<String, dynamic> params);
}
