import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product_search_result.g.dart';

/// Information about a product.
@JsonSerializable()
class ProductSearchResult {
  /// The Product.
  final dynamic product;

  /// A confidence level on the match, ranging from 0 (no confidence) to 1 (full confidence).
  final double score;

  /// The resource name of the image from the product that is the closest match to the query.
  final String image;

  ProductSearchResult({
    required this.product,
    required this.score,
    required this.image,
  });

  factory ProductSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSearchResultToJson(this);

  @override
  String toString() => json.encode(toJson());
}
