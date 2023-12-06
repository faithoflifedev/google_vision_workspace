// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSearchParams _$ProductSearchParamsFromJson(Map<String, dynamic> json) =>
    ProductSearchParams(
      boundingPoly: json['boundingPoly'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
      productSet: json['productSet'] as String,
      productCategories: (json['productCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      filter: json['filter'] as String,
    );

Map<String, dynamic> _$ProductSearchParamsToJson(
        ProductSearchParams instance) =>
    <String, dynamic>{
      'boundingPoly': instance.boundingPoly,
      'productSet': instance.productSet,
      'productCategories': instance.productCategories,
      'filter': instance.filter,
    };
