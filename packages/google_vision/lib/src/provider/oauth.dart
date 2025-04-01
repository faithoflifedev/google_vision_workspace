import 'package:google_vision/google_vision.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'oauth.g.dart';

@RestApi(baseUrl: 'https://accounts.google.com/o/oauth2')
abstract class OAuthClient {
  factory OAuthClient(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _OAuthClient;

  @POST('/token')
  @Headers(
      <String, dynamic>{"Content-Type": "application/x-www-form-urlencoded"})
  Future<Token> getToken(@Body() Map<String, dynamic> params);
}
