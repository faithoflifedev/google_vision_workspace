import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

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

  List<int>? pages;

  GoogleVision get googleVision => _googleVision!;

  Future<void> initializeGoogleVision() async {
    _googleVision =
        await GoogleVision().withJwtFile(globalResults!['credential-file']);

    pages =
        (argResults!['pages'] as String?)?.split(',').map(int.parse).toList();
  }

  /// Helper method to get the features from the command line.
  List<Feature> getFeatures([String? features]) =>
      (argResults!['features'] as String)
          .split(',')
          .map(
            (element) => Feature(
                maxResults: int.parse(argResults!['max-results']),
                type: AnnotationType.values.byName(element)),
          )
          .toList();

  /// Helper methods used by most of the cli commands.
  Future<BatchAnnotateImagesResponse> annotateImage(ByteBuffer buffer,
      [String? features]) async {
    final requests = [
      AnnotateImageRequest(
        jsonImage: JsonImage(byteBuffer: buffer),
        features: getFeatures(features),
      )
    ];

    return googleVision.image.annotate(requests: requests);
  }

  /// Helper methods used by most of the cli commands.
  Future<BatchAnnotateFilesResponse> annotateFile(
    File file, {
    String? features,
    ImageContext? imageContext,
    required List<int> pages,
  }) async =>
      googleVision.file.annotate(requests: [
        AnnotateFileRequest(
          inputConfig: InputConfig.fromFile(file),
          features: getFeatures(features),
          imageContext: imageContext,
          pages: pages,
        )
      ]);
}
