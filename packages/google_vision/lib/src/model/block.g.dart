// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
  property: json['property'] == null
      ? null
      : TextProperty.fromJson(json['property'] as Map<String, dynamic>),
  boundingBox: json['boundingBox'] == null
      ? null
      : BoundingPoly.fromJson(json['boundingBox'] as Map<String, dynamic>),
  blockType:
      $enumDecodeNullable(
        _$BlockTypeEnumMap,
        json['blockType'],
        unknownValue: BlockType.UNKNOWN,
      ) ??
      BlockType.UNKNOWN,
  paragraphs: (json['paragraphs'] as List<dynamic>?)
      ?.map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
      .toList(),
  confidence: (json['confidence'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
  'property': instance.property?.toJson(),
  'boundingBox': instance.boundingBox?.toJson(),
  'paragraphs': instance.paragraphs?.map((e) => e.toJson()).toList(),
  'blockType': _$BlockTypeEnumMap[instance.blockType]!,
  'confidence': instance.confidence,
};

const _$BlockTypeEnumMap = {
  BlockType.UNKNOWN: 'UNKNOWN',
  BlockType.TEXT: 'TEXT',
  BlockType.TABLE: 'TABLE',
  BlockType.PICTURE: 'PICTURE',
  BlockType.RULER: 'RULER',
  BlockType.BARCODE: 'BARCODE',
};
