// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSearchResult _$ProductSearchResultFromJson(Map<String, dynamic> json) =>
    ProductSearchResult(
      product: json['product'],
      score: (json['score'] as num).toDouble(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductSearchResultToJson(
  ProductSearchResult instance,
) => <String, dynamic>{
  'product': instance.product,
  'score': instance.score,
  'image': instance.image,
};
