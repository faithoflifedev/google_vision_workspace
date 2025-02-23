// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landmark _$LandmarkFromJson(Map<String, dynamic> json) => Landmark(
      type: $enumDecode(_$LandmarkTypeEnumMap, json['type'],
          unknownValue: LandmarkType.UNKNOWN_LANDMARK),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LandmarkToJson(Landmark instance) => <String, dynamic>{
      'type': _$LandmarkTypeEnumMap[instance.type]!,
      'position': instance.position.toJson(),
    };

const _$LandmarkTypeEnumMap = {
  LandmarkType.UNKNOWN_LANDMARK: 'Unknown',
  LandmarkType.LEFT_EYE: 'LEFT_EYE',
  LandmarkType.RIGHT_EYE: 'RIGHT_EYE',
  LandmarkType.LEFT_OF_LEFT_EYEBROW: 'LEFT_OF_LEFT_EYEBROW',
  LandmarkType.RIGHT_OF_LEFT_EYEBROW: 'RIGHT_OF_LEFT_EYEBROW',
  LandmarkType.LEFT_OF_RIGHT_EYEBROW: 'LEFT_OF_RIGHT_EYEBROW',
  LandmarkType.RIGHT_OF_RIGHT_EYEBROW: 'RIGHT_OF_RIGHT_EYEBROW',
  LandmarkType.MIDPOINT_BETWEEN_EYES: 'MIDPOINT_BETWEEN_EYES',
  LandmarkType.NOSE_TIP: 'NOSE_TIP',
  LandmarkType.UPPER_LIP: 'UPPER_LIP',
  LandmarkType.LOWER_LIP: 'LOWER_LIP',
  LandmarkType.MOUTH_LEFT: 'MOUTH_LEFT',
  LandmarkType.MOUTH_RIGHT: 'MOUTH_RIGHT',
  LandmarkType.MOUTH_CENTER: 'MOUTH_CENTER',
  LandmarkType.NOSE_BOTTOM_RIGHT: 'NOSE_BOTTOM_RIGHT',
  LandmarkType.NOSE_BOTTOM_LEFT: 'NOSE_BOTTOM_LEFT',
  LandmarkType.NOSE_BOTTOM_CENTER: 'NOSE_BOTTOM_CENTER',
  LandmarkType.LEFT_EYE_TOP_BOUNDARY: 'LEFT_EYE_TOP_BOUNDARY',
  LandmarkType.LEFT_EYE_RIGHT_CORNER: 'LEFT_EYE_RIGHT_CORNER',
  LandmarkType.LEFT_EYE_BOTTOM_BOUNDARY: 'LEFT_EYE_BOTTOM_BOUNDARY',
  LandmarkType.LEFT_EYE_LEFT_CORNER: 'LEFT_EYE_LEFT_CORNER',
  LandmarkType.RIGHT_EYE_TOP_BOUNDARY: 'RIGHT_EYE_TOP_BOUNDARY',
  LandmarkType.RIGHT_EYE_RIGHT_CORNER: 'RIGHT_EYE_RIGHT_CORNER',
  LandmarkType.RIGHT_EYE_BOTTOM_BOUNDARY: 'RIGHT_EYE_BOTTOM_BOUNDARY',
  LandmarkType.RIGHT_EYE_LEFT_CORNER: 'RIGHT_EYE_LEFT_CORNER',
  LandmarkType.LEFT_EYEBROW_UPPER_MIDPOINT: 'LEFT_EYEBROW_UPPER_MIDPOINT',
  LandmarkType.RIGHT_EYEBROW_UPPER_MIDPOINT: 'RIGHT_EYEBROW_UPPER_MIDPOINT',
  LandmarkType.LEFT_EAR_TRAGION: 'LEFT_EAR_TRAGION',
  LandmarkType.RIGHT_EAR_TRAGION: 'RIGHT_EAR_TRAGION',
  LandmarkType.LEFT_EYE_PUPIL: 'LEFT_EYE_PUPIL',
  LandmarkType.RIGHT_EYE_PUPIL: 'RIGHT_EYE_PUPIL',
  LandmarkType.FOREHEAD_GLABELLA: 'FOREHEAD_GLABELLA',
  LandmarkType.CHIN_GNATHION: 'CHIN_GNATHION',
  LandmarkType.CHIN_LEFT_GONION: 'CHIN_LEFT_GONION',
  LandmarkType.CHIN_RIGHT_GONION: 'CHIN_RIGHT_GONION',
  LandmarkType.LEFT_CHEEK_CENTER: 'LEFT_CHEEK_CENTER',
  LandmarkType.RIGHT_CHEEK_CENTER: 'RIGHT_CHEEK_CENTER',
};
