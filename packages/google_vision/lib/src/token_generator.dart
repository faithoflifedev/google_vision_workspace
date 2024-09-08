import 'dart:convert';

import 'package:crypto_keys_plus/crypto_keys.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:jose_plus/jose.dart';
// import 'package:universal_io/io.dart';

abstract class TokenGenerator {
  Future<Token> generate();
}

class JwtGenerator implements TokenGenerator {
  // final String credentials;
  // final String scope;
  final Dio dio;

  final JwtCredentials jwtCredentials;

  JwtGenerator({
    required String credentials,
    required String scope,
    required this.dio,
  }) : jwtCredentials = JwtCredentials.fromJson(
            {'settings': jsonDecode(credentials), 'scope': scope});

  // factory JwtGenerator.fromFile({
  //   required String credentialsFile,
  //   required String scope,
  //   required Dio dio,
  // }) =>
  //     JwtGenerator(
  //         credentials: File(credentialsFile).readAsStringSync(),
  //         scope: scope,
  //         dio: dio);

  /// generate a OAuth2 refresh token from JWT credentials
  @override
  Future<Token> generate() async {
    final now = DateTime.now();

    final jsonWebKey = JsonWebKey.fromPem(jwtCredentials.settings.privateKey);

    final keyPair = jsonWebKey.cryptoKeyPair;

    final privateKey = keyPair.privateKey!;

    final signer = privateKey.createSigner(algorithms.signing.rsa.sha256);

    final header = Util.base64GCloudString('{"alg":"RS256","typ":"JWT"}');

    final claim = Util.base64GCloudString('''{
      "iss": "${jwtCredentials.settings.clientEmail}",
      "scope": "${jwtCredentials.scope}",
      "aud": "https://www.googleapis.com/oauth2/v4/token",
      "exp": ${Util.unixTimeStamp(now.add(Duration(minutes: 60)))},
      "iat": ${Util.unixTimeStamp(now)}
}''');

    final signature = signer.sign('$header.$claim'.codeUnits);

    final jwt = '$header.$claim.${Util.base64GCloudList(signature.data)}';

    final OAuthClient oAuthClient = OAuthClient(dio);

    return await oAuthClient.getToken({
      'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      'assertion': jwt
    });
  }
}
