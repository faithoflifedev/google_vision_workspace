// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Symbol _$SymbolFromJson(Map<String, dynamic> json) => Symbol(
      property: json['property'] == null
          ? null
          : TextProperty.fromJson(json['property'] as Map<String, dynamic>),
      boundingBox: json['boundingBox'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingBox'] as Map<String, dynamic>),
      text: json['text'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SymbolToJson(Symbol instance) => <String, dynamic>{
      'property': instance.property?.toJson(),
      'boundingBox': instance.boundingBox?.toJson(),
      'text': instance.text,
      'confidence': instance.confidence,
    };
