// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSearchResults _$ProductSearchResultsFromJson(
        Map<String, dynamic> json) =>
    ProductSearchResults(
      rawIndexTime: json['indexTime'] as String,
      productGroupedResults: (json['productGroupedResults'] as List<dynamic>)
          .map((e) => GroupedResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      productResults: (json['results'] as List<dynamic>)
          .map((e) => ProductSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductSearchResultsToJson(
        ProductSearchResults instance) =>
    <String, dynamic>{
      'indexTime': instance.rawIndexTime,
      'results': instance.productResults,
      'productGroupedResults': instance.productGroupedResults,
    };
