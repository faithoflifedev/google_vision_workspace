// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_hints_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropHintsParams _$CropHintsParamsFromJson(Map<String, dynamic> json) =>
    CropHintsParams(
      aspectRatios: (json['aspectRatios'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$CropHintsParamsToJson(CropHintsParams instance) =>
    <String, dynamic>{
      'aspectRatios': instance.aspectRatios,
    };
