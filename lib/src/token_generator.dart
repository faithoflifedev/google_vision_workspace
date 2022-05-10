import 'dart:convert';

import 'package:crypto_keys/crypto_keys.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision/util/util.dart';
import 'package:jose/jose.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

import 'authorization_exception.dart';

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

    final jwt = '$header.$claim.' + Util.base64GCloudList(signature.data);

    final OAuthClient oAuthClient = OAuthClient(dio);

    return await oAuthClient.getToken({
      'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      'assertion': jwt
    });
  }
}

class OAuthGenerator implements TokenGenerator {
  final Dio dio;
  final OAuthCredentials oauthCredentials;
  final bool refresh;

  OAuthGenerator(
      {required this.oauthCredentials,
      required this.dio,
      this.refresh = false});

  factory OAuthGenerator.fromYamlCredentials(
      {required String credentialsFile, required Dio dio}) {
    return OAuthGenerator(
        oauthCredentials: OAuthCredentials.fromJson(jsonDecode(
            jsonEncode(loadYaml(File(credentialsFile).readAsStringSync())))),
        dio: dio);
  }

  ///generate and persist the OAuth2 refresh token from a single use auth code
  @override
  Future<Token> generate() async {
    final OAuthClient oAuthClient = OAuthClient(dio);

    final tokenFile = File('${Util.userHome}/.refreshToken.json');

    final tokenFileExits = tokenFile.existsSync();

    if (tokenFileExits && refresh) tokenFile.deleteSync();

    final tokenStore = <String, dynamic>{};

    String? refreshToken;

    if (tokenFileExits) {
      tokenStore.addAll(json.decode(tokenFile.readAsStringSync()));
    }

    if (tokenStore.containsKey(oauthCredentials.clientId)) {
      refreshToken = tokenStore[oauthCredentials.clientId];
    } else {
      try {
        final token = await oAuthClient.getToken({
          'client_id': oauthCredentials.clientId,
          'client_secret': oauthCredentials.clientSecret,
          'code': oauthCredentials.code,
          'redirect_uri': 'urn:ietf:wg:oauth:2.0:oob',
          'grant_type': 'authorization_code'
        });

        if (token.refreshToken == null) {
          throw Exception('Could not retrieve the refresh token');
        }

        refreshToken = token.refreshToken!;
      } on DioError catch (err) {
        throw AuthorizationException(err.response.toString(), err);
      }

      tokenStore[oauthCredentials.clientId] = refreshToken;

      tokenFile.writeAsStringSync(json.encode(tokenStore));
    }

    return await oAuthClient.getToken({
      'client_id': oauthCredentials.clientId,
      'client_secret': oauthCredentials.clientSecret,
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token'
    });
  }
}
