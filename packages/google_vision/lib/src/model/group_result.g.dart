// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupedResult _$GroupedResultFromJson(Map<String, dynamic> json) =>
    GroupedResult(
      boundingPoly:
          BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
      productResults: (json['results'] as List<dynamic>)
          .map((e) => ProductSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectAnnotations: (json['objectAnnotations'] as List<dynamic>)
          .map((e) => ObjectAnnotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupedResultToJson(GroupedResult instance) =>
    <String, dynamic>{
      'boundingPoly': instance.boundingPoly,
      'results': instance.productResults,
      'objectAnnotations': instance.objectAnnotations,
    };
