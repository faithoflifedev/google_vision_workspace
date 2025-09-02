import 'dart:convert';
import 'dart:typed_data';

import 'package:mime/mime.dart';

import 'gcs_source.dart';

class InputConfig {
  /// The Google Cloud Storage location to read the input from.
  final GcsSource? gcsSource;

  /// File content, represented as a stream of bytes. Note: As with all bytes
  /// fields, protobuffers use a pure binary representation, whereas JSON
  /// representations use base64.
  ///
  /// Currently, this field only works for files.annotate requests. It does not
  /// work for files.asyncBatchAnnotate requests.
  ///
  /// A base64-encoded string.
  final ByteBuffer? content;

  /// The type of the file. Currently only "application/pdf", "image/tiff" and
  /// "image/gif" are supported. Wildcards are not supported.
  final String mimeType;

  InputConfig({this.gcsSource, this.content, required this.mimeType});

  factory InputConfig.fromJson(Map<String, dynamic> json) => InputConfig(
    content: json.containsKey('content')
        ? base64.decode(json['content']).buffer
        : null,
    mimeType: json['mimeType'],
  );

  Map<String, dynamic> toJson() => content != null
      ? {'content': base64Encode(content!.asUint8List()), 'mimeType': mimeType}
      : {'gcsSource': gcsSource, 'mimeType': mimeType};

  factory InputConfig.fromBuffer(ByteBuffer buffer, [String? mimeType]) =>
      InputConfig(
        content: buffer,
        mimeType: mimeType ?? mimeTypeFromContent(buffer),
      );

  factory InputConfig.fromGsUri(String gsUri) => InputConfig(
    gcsSource: GcsSource(uri: gsUri),
    mimeType: mimeTypeFromFileName(gsUri.split('/').last),
  );

  static String mimeTypeFromFileName(String fileName) {
    final mimeType = lookupMimeType(fileName.split('/').last);

    if (mimeType == null) {
      throw Exception('Invalid mimeType');
    }

    return mimeType;
  }

  static String mimeTypeFromContent(ByteBuffer content) {
    final mimeType = lookupMimeType(
      '',
      headerBytes: content.asUint8List().sublist(0, 8),
    );

    if (mimeType == null) {
      throw Exception('Invalid mimeType');
    }

    return mimeType;
  }

  @override
  String toString() => json.encode(toJson());
}
