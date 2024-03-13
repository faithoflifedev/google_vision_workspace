import 'dart:convert';

import 'package:google_vision/src/model/bounding_poly.dart';
import 'package:json_annotation/json_annotation.dart';

import 'annotation.dart';
import 'location_info.dart';
import 'property.dart';

part 'entity_annotation.g.dart';

/// Set of detected labels
@JsonSerializable()
class EntityAnnotation extends Annotation {
  /// Opaque entity ID. Some IDs may be available in Google Knowledge Graph
  /// Search API.
  final String? mid;

  /// The language code for the locale in which the entity textual description
  /// is expressed.
  final String? locale;

  /// Entity textual description, expressed in its locale language.
  // final String description;

  /// Score of the result. Range \[0, 1\].
  // final double? score;

  /// The relevancy of the ICA (Image Content Annotation) label to the image.
  /// For example, the relevancy of "tower" is likely higher to an image
  /// containing the detected "Eiffel Tower" than to an image containing a
  /// detected distant towering building, even though the confidence that there
  /// is a tower in each image may be the same. Range \[0, 1\].
  final double? topicality;

  /// Image region to which this entity belongs. Not produced for
  /// LABEL_DETECTION features.
  // BoundingPoly? boundingPoly;

  /// The location information for the detected entity. Multiple LocationInfo
  /// elements can be present because one location may indicate the location of
  /// the scene in the image, and another location may indicate the location of
  /// the place where the image was taken. Location information is usually
  /// present for landmarks.
  final List<LocationInfo>? locationInfo;

  final List<Property>? properties;

  EntityAnnotation({
    this.mid,
    this.locale,
    required super.description,
    super.score,
    this.topicality,
    super.boundingPoly,
    this.locationInfo,
    this.properties,
  });

  factory EntityAnnotation.fromJson(Map<String, dynamic> json) =>
      _$EntityAnnotationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EntityAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
