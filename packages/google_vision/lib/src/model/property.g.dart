// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
  name: json['name'] as String,
  value: json['value'] as String?,
  number: json['number'] as num?,
);

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
  'number': instance.number,
};
