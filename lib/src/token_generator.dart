import 'dart:convert';

import 'package:crypto_keys/crypto_keys.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:jose/jose.dart';
import 'package:universal_io/io.dart';

abstract class TokenGenerator {
  Future<Token> generate();
}

class JwtGenerator implements TokenGenerator {
  final String credentialsFile;
  final String scope;
  final Dio dio;

  final JwtCredentials jwtCredentials;

  JwtGenerator(
      {required this.credentialsFile, required this.scope, required this.dio})
      : jwtCredentials = JwtCredentials.fromJson({
          'settings': jsonDecode(File(credentialsFile).readAsStringSync()),
          'scope': scope
        });

  ///generate a OAuth2 refresh token from JWT credentials
  @override
  Future<Token> generate() async {
    final key = JsonWebKey.fromPem(jwtCredentials.settings.privateKey);

    final privateKey = key.cryptoKeyPair;

    final signer = privateKey.createSigner(algorithms.signing.rsa.sha256);

    final header = Util.base64GCloudString('{"alg":"RS256","typ":"JWT"}');

    final claim = Util.base64GCloudString(
        '{"iss": "${jwtCredentials.settings.clientEmail}","scope": "${jwtCredentials.scope}","aud": "https://www.googleapis.com/oauth2/v4/token", "exp": ${Util.unixTimeStamp(DateTime.now().add(Duration(seconds: 3599)))},"iat": ${Util.unixTimeStamp(DateTime.now())}}');

    final signature = signer.sign('$header.$claim'.codeUnits);

    final jwt = '$header.$claim.${Util.base64GCloudList(signature.data)}';

    final OAuthClient oAuthClient = OAuthClient(dio);

    return await oAuthClient.getToken({
      'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      'assertion': jwt
    });
  }
}
