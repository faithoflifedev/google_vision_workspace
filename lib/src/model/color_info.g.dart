// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorInfo _$ColorInfoFromJson(Map<String, dynamic> json) => ColorInfo(
      color: Color.fromJson(json['color'] as Map<String, dynamic>),
      score: (json['score'] as num).toDouble(),
      pixelFraction: (json['pixelFraction'] as num).toDouble(),
    );

Map<String, dynamic> _$ColorInfoToJson(ColorInfo instance) => <String, dynamic>{
      'color': instance.color,
      'score': instance.score,
      'pixelFraction': instance.pixelFraction,
    };
