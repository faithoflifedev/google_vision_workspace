// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_break.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectedBreak _$DetectedBreakFromJson(Map<String, dynamic> json) =>
    DetectedBreak(
      type: $enumDecodeNullable(_$BreakTypeEnumMap, json['type'],
              unknownValue: BreakType.UNKNOWN) ??
          BreakType.UNKNOWN,
      isPrefix: json['isPrefix'] as bool?,
    );

Map<String, dynamic> _$DetectedBreakToJson(DetectedBreak instance) =>
    <String, dynamic>{
      'type': _$BreakTypeEnumMap[instance.type]!,
      'isPrefix': instance.isPrefix,
    };

const _$BreakTypeEnumMap = {
  BreakType.UNKNOWN: 'UNKNOWN',
  BreakType.SPACE: 'SPACE',
  BreakType.EOL_SURE_SPACE: 'EOL_SURE_SPACE',
  BreakType.HYPHEN: 'HYPHEN',
  BreakType.LINE_BREAK: 'LINE_BREAK',
};
