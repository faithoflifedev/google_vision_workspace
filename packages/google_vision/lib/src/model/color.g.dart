// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      red: (json['red'] as num?)?.toDouble() ?? 0.0,
      green: (json['green'] as num?)?.toDouble() ?? 0.0,
      blue: (json['blue'] as num?)?.toDouble() ?? 0.0,
      alpha: (json['alpha'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'alpha': instance.alpha,
    };
