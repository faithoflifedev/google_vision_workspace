// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_hint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropHint _$CropHintFromJson(Map<String, dynamic> json) => CropHint(
      boundingPoly:
          BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
      confidence: (json['confidence'] as num).toDouble(),
      importanceFraction: (json['importanceFraction'] as num).toDouble(),
    );

Map<String, dynamic> _$CropHintToJson(CropHint instance) => <String, dynamic>{
      'boundingPoly': instance.boundingPoly,
      'confidence': instance.confidence,
      'importanceFraction': instance.importanceFraction,
    };
