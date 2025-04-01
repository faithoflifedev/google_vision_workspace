import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:retrofit/retrofit.dart';

part 'files.g.dart';

/// Service that performs image detection and annotation for a batch of files.
/// Now only "application/pdf", "image/tiff" and "image/gif" are supported.
///
/// This service will extract at most 5 (customers can specify which 5 in
/// AnnotateFileRequest.pages) frames (gif) or pages (pdf or tiff) from each
/// file provided and perform detection and annotation for each image extracted.
@RestApi(baseUrl: 'https://vision.googleapis.com/v1')
abstract class FilesClient {
  factory FilesClient(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _FilesClient;

  /// Run image detection and annotation for a batch of images.
  @POST('/files:annotate')
  Future<BatchAnnotateFilesResponse> annotate(
      @Header('Content-Type') String contentType,
      // @Header('x-goog-user-project') String? projectId,
      @Body() Map<String, dynamic> params);
}
