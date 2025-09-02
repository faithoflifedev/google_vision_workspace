import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';

part 'product_search_params.g.dart';

/// Parameters for product search.
@JsonSerializable()
class ProductSearchParams {
  /// The bounding polygon around the area of interest in the image. If it is
  /// not specified, system discretion will be applied.
  final BoundingPoly? boundingPoly;

  /// The resource name of a ProductSet to be searched for similar images.
  ///
  /// Format is: projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID.
  final String productSet;

  /// The list of product categories to search in. Currently, we only consider
  /// the first category, and either "homegoods-v2", "apparel-v2", "toys-v2",
  /// "packagedgoods-v1", or "general-v1" should be specified. The legacy
  /// categories "homegoods", "apparel", and "toys" are still supported but will
  /// be deprecated. For new products, please use "homegoods-v2", "apparel-v2",
  /// or "toys-v2" for better product search accuracy. It is recommended to
  /// migrate existing products to these categories as well.
  final List<String> productCategories;

  /// The filtering expression. This can be used to restrict search results
  /// based on Product labels. We currently support an AND of OR of key-value
  /// expressions, where each expression within an OR must have the same key. An
  /// '=' should be used to connect the key and value.
  ///
  /// For example, "(color = red OR color = blue) AND brand = Google" is
  /// acceptable, but "(color = red OR brand = Google)" is not acceptable.
  /// "color: red" is not acceptable because it uses a ':' instead of an '='.
  final String filter;

  ProductSearchParams({
    this.boundingPoly,
    required this.productSet,
    required this.productCategories,
    required this.filter,
  });

  factory ProductSearchParams.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSearchParamsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
