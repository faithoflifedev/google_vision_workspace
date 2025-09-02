import 'dart:io';
import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:loggy/loggy.dart';

/// Helper method to that retrieves error message string.
extension UsageExtension on DioException {
  String get usage {
    return response?.data['error']['errors'] == null
        ? message!
        : response!.data['error']['errors'].toString();
  }
}

/// Helper methods used by most of the cli commands.
abstract class VisionHelper extends Command {
  GoogleVision? _googleVision;

  GoogleVision get googleVision => _googleVision!;

  List<int>? pages;

  late final File imageFile;

  late final Uint8List imageBytes;

  Future<void> initializeGoogleVision() async {
    final logLevel = _toLogLevel(globalResults!['log-level']);

    _googleVision = await GoogleVision(
      logLevel,
    ).withJwt(credentialsFromFile(File(globalResults!['credential-file'])));

    imageFile = File(argResults!['image-file']);

    imageBytes = await imageFile.readAsBytes();

    if (argResults != null && argResults!['pages'] != null) {
      pages = (argResults!['pages'] as String?)
          ?.split(',')
          .map(int.parse)
          .toList();
    }
  }

  String credentialsFromFile(File file) => file.readAsStringSync();

  String credentialsFromFileName(String fileName) =>
      credentialsFromFile(File(fileName));

  /// Helper method to get the features from the command line.
  List<Feature> getFeatures() => (argResults!['features'] as String)
      .split(',')
      .map(
        (element) => Feature(
          maxResults: int.parse(argResults!['max-results']),
          type: _toAnnotationType(element),
        ),
      )
      .toList();

  /// Helper methods used by most of the cli commands.
  Future<BatchAnnotateImagesResponse> annotateImage() {
    final requests = [
      AnnotateImageRequest(
        jsonImage: JsonImage(byteBuffer: imageBytes.buffer),
        features: getFeatures(),
      ),
    ];

    return googleVision.image.annotate(requests: requests);
  }

  /// Helper methods used by most of the cli commands.
  Future<BatchAnnotateFilesResponse> annotateFile({
    ImageContext? imageContext,
  }) async {
    return googleVision.file.annotate(
      requests: [
        AnnotateFileRequest(
          inputConfig: InputConfig.fromBuffer(imageBytes.buffer),
          features: getFeatures(),
          imageContext: imageContext,
          pages: pages,
        ),
      ],
    );
  }

  /// Helper method to convert string from cli argument to enum.
  static AnnotationType _toAnnotationType(String type) =>
      AnnotationType.values.firstWhere(
        (annotationType) => annotationType.type == type.trim(),
        orElse: () => AnnotationType.typeUnspecified,
      );

  /// Helper method to convert string from cli argument to enum.
  static LogLevel _toLogLevel(String name) => LogLevel.values.firstWhere(
    (logLevel) => logLevel.name.toLowerCase() == name.trim().toLowerCase(),
    orElse: () => LogLevel.off,
  );
}
