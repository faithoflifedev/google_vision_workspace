// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      property: json['property'] == null
          ? null
          : TextProperty.fromJson(json['property'] as Map<String, dynamic>),
      boundingBox: json['boundingBox'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingBox'] as Map<String, dynamic>),
      symbols: (json['symbols'] as List<dynamic>?)
          ?.map((e) => Symbol.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'property': instance.property?.toJson(),
      'boundingBox': instance.boundingBox?.toJson(),
      'symbols': instance.symbols?.map((e) => e.toJson()).toList(),
      'confidence': instance.confidence,
    };
