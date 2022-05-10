import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:retrofit/retrofit.dart';

part 'vision.g.dart';

///Integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.
@RestApi(baseUrl: 'https://vision.googleapis.com/v1')
abstract class VisionClient {
  factory VisionClient(Dio dio, {String baseUrl}) = _VisionClient;

  ///Run image detection and annotation for a batch of images.
  @POST('/images:annotate')
  Future<AnnotatedResponses> annotate(
      @Header('Authorization') String authorization,
      @Header('Content-Type') String contentType,
      @Body() Map<String, dynamic> params);
}
