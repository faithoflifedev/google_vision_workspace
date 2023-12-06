import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';
import 'object_annotation.dart';
import 'product_search_result.dart';

part 'group_result.g.dart';

/// Information about the products similar to a single product in a query image.
@JsonSerializable()
class GroupedResult {
  /// The bounding polygon around the product detected in the query image.
  final BoundingPoly boundingPoly;

  /// List of results, one for each product match.
  @JsonKey(name: 'results')
  final List<ProductSearchResult> productResults;

  /// List of generic predictions for the object in the bounding box.
  final List<ObjectAnnotation> objectAnnotations;

  GroupedResult({
    required this.boundingPoly,
    required this.productResults,
    required this.objectAnnotations,
  });

  factory GroupedResult.fromJson(Map<String, dynamic> json) =>
      _$GroupedResultFromJson(json);

  Map<String, dynamic> toJson() => _$GroupedResultToJson(this);

  @override
  String toString() => json.encode(toJson());
}
