// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      red: (json['red'] as num).toDouble(),
      green: (json['green'] as num).toDouble(),
      blue: (json['blue'] as num).toDouble(),
      alpha: (json['alpha'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'alpha': instance.alpha,
    };
