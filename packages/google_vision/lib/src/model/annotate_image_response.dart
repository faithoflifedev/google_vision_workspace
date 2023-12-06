import 'dart:convert' show json;

import 'package:google_vision/src/model/annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'crop_hints_annotation.dart';
import 'face_annotation.dart';
import 'image_annotation_context.dart';
import 'image_properties_annotation.dart';
import 'entity_annotation.dart';
import 'localized_object_annotation.dart';
import 'product_search_results.dart';
import 'safe_search_annotation.dart';
import 'status.dart';
import 'full_text_annotation.dart';
import 'web_detection.dart';

part 'annotate_image_response.g.dart';

/// Individual responses to image annotation requests within the batch.
@JsonSerializable()
class AnnotateImageResponse {
  /// If present, face detection has completed successfully.
  @JsonKey(name: 'faceAnnotations')
  final List<FaceAnnotation>? faceAnnotationList;

  /// If present, landmark detection has completed successfully.
  @JsonKey(name: 'landmarkAnnotations')
  final List<EntityAnnotation>? landmarkAnnotationList;

  /// If present, logo detection has completed successfully.
  @JsonKey(name: 'logoAnnotations')
  final List<EntityAnnotation>? logoAnnotationList;

  /// If present, label detection has completed successfully.
  @JsonKey(name: 'labelAnnotations')
  final List<EntityAnnotation>? labelAnnotationList;

  /// If present, localized object detection has completed successfully. This
  /// will be sorted descending by confidence score.
  @JsonKey(name: 'localizedObjectAnnotations')
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotationList;

  /// If present, text (OCR) detection has completed successfully.
  @JsonKey(name: 'textAnnotations')
  final List<EntityAnnotation>? textAnnotationsList;

  /// If present, text (OCR) detection or document (OCR) text detection has
  /// completed successfully. This annotation provides the structural hierarchy
  /// for the OCR detected text.
  @JsonKey(name: 'fullTextAnnotation')
  final FullTextAnnotation? fullTextAnnotation;

  /// If present, safe-search annotation has completed successfully.
  @JsonKey(name: 'safeSearchAnnotation')
  final SafeSearchAnnotation? safeSearchAnnotation;

  /// If present, image properties were extracted successfully.
  @JsonKey(name: 'imagePropertiesAnnotation')
  final ImagePropertiesAnnotation? imagePropertiesAnnotation;

  /// If present, crop hints have completed successfully.
  @JsonKey(name: 'cropHintsAnnotation')
  final CropHintsAnnotation? cropHintsAnnotation;

  /// Relevant information for the image from the Internet.
  @JsonKey(name: 'webDetection')
  final WebDetection? webDetection;

  /// If present, product search has completed successfully.
  @JsonKey(name: 'productSearchResults')
  final ProductSearchResults? productSearchResults;

  /// If set, represents the error message for the operation. Note that
  /// filled-in image annotations are guaranteed to be correct, even when error
  /// is set.
  @JsonKey(name: 'error')
  final Status? error;

  /// If present, contextual information is needed to understand where this image comes from.
  @JsonKey(name: 'context')
  final ImageAnnotationContext? context;

  /// If present, face detection has completed successfully.
  List<FaceAnnotation> get faceAnnotations =>
      faceAnnotationList ?? <FaceAnnotation>[];

  /// If present, face detection has completed successfully.
  List<EntityAnnotation> get landmarkAnnotations =>
      landmarkAnnotationList ?? <EntityAnnotation>[];

  /// If present, label  detection has completed successfully.
  List<EntityAnnotation> get labelAnnotations =>
      labelAnnotationList ?? <EntityAnnotation>[];

  /// If present, logo detection has completed successfully.
  List<EntityAnnotation> get logoAnnotations =>
      logoAnnotationList ?? <EntityAnnotation>[];

  /// If present, localized object detection has completed successfully. This
  /// will be sorted descending by confidence score.
  List<LocalizedObjectAnnotation> get localizedObjectAnnotations =>
      localizedObjectAnnotationList ?? <LocalizedObjectAnnotation>[];

  /// If present, full text detection has completed successfully.
  List<EntityAnnotation> get textAnnotations =>
      textAnnotationsList ?? <EntityAnnotation>[];

  AnnotateImageResponse({
    this.faceAnnotationList,
    this.landmarkAnnotationList,
    this.labelAnnotationList,
    this.localizedObjectAnnotationList,
    this.logoAnnotationList,
    this.textAnnotationsList,
    this.fullTextAnnotation,
    this.safeSearchAnnotation,
    this.imagePropertiesAnnotation,
    this.cropHintsAnnotation,
    this.webDetection,
    this.productSearchResults,
    this.error,
    this.context,
  });

  List<Annotation> get annotations {
    final genericAnnotations = <Annotation>[];

    if (landmarkAnnotationList != null) {
      genericAnnotations.addAll(landmarkAnnotations);
    }

    if (labelAnnotationList != null) {
      genericAnnotations.addAll(labelAnnotations);
    }

    if (logoAnnotationList != null) {
      genericAnnotations.addAll(logoAnnotations);
    }

    if (textAnnotationsList != null) {
      genericAnnotations.addAll(textAnnotations);
    }

    if (localizedObjectAnnotationList != null) {
      genericAnnotations.addAll(localizedObjectAnnotations);
    }

    return genericAnnotations;
  }

  factory AnnotateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotateImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotateImageResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
