import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'group_result.dart';
import 'product_search_result.dart';

part 'product_search_results.g.dart';

/// Information about the products similar to a single product in a query image.
@JsonSerializable()
class ProductSearchResults {
  /// Timestamp of the index which provided these results. Products added to the
  /// product set and products removed from the product set after this time are
  /// not reflected in the current results.
  ///
  /// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and
  /// up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and
  /// "2014-10-02T15:01:23.045123456Z".
  @JsonKey(name: 'indexTime')
  final String rawIndexTime;

  /// List of results grouped by products detected in the query image. Each
  /// entry corresponds to one bounding polygon in the query image, and contains
  /// the matching products specific to that region. There may be duplicate
  /// product matches in the union of all the per-product results.
  @JsonKey(name: 'results')
  final List<ProductSearchResult> productResults;

  /// List of results, one for each product match.
  final List<GroupedResult> productGroupedResults;

  DateTime get indexTime => DateTime.parse(rawIndexTime);

  ProductSearchResults({
    required this.rawIndexTime,
    required this.productGroupedResults,
    required this.productResults,
  });

  factory ProductSearchResults.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSearchResultsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
