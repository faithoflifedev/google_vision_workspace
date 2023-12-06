// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      property: json['property'] == null
          ? null
          : TextProperty.fromJson(json['property'] as Map<String, dynamic>),
      width: json['width'] as int,
      height: json['height'] as int,
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'property': instance.property?.toJson(),
      'width': instance.width,
      'height': instance.height,
      'blocks': instance.blocks?.map((e) => e.toJson()).toList(),
      'confidence': instance.confidence,
    };
