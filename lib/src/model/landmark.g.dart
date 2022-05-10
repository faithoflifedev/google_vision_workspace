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
      'type': _$LandmarkTypeEnumMap[instance.type],
      'position': instance.position.toJson(),
    };

const _$LandmarkTypeEnumMap = {
  LandmarkType.UNKNOWN_LANDMARK: 'Unknown',
  LandmarkType.LEFT_EYE: 'Left eye',
  LandmarkType.RIGHT_EYE: 'Right eye',
  LandmarkType.LEFT_OF_LEFT_EYEBROW: 'Left of left eyebrow',
  LandmarkType.RIGHT_OF_LEFT_EYEBROW: 'Right of left eyebrow',
  LandmarkType.LEFT_OF_RIGHT_EYEBROW: 'Left of right eyebrow',
  LandmarkType.RIGHT_OF_RIGHT_EYEBROW: 'Right of right eyebrow',
  LandmarkType.MIDPOINT_BETWEEN_EYES: 'Midpoint between eyes',
  LandmarkType.NOSE_TIP: 'Nose tip',
  LandmarkType.UPPER_LIP: 'Upper lip',
  LandmarkType.LOWER_LIP: 'Lower lip',
  LandmarkType.MOUTH_LEFT: 'Mouth left',
  LandmarkType.MOUTH_RIGHT: 'Mouth right',
  LandmarkType.MOUTH_CENTER: 'Mouth center',
  LandmarkType.NOSE_BOTTOM_RIGHT: 'Nose, bottom right',
  LandmarkType.NOSE_BOTTOM_LEFT: 'Nose, bottom left',
  LandmarkType.NOSE_BOTTOM_CENTER: 'Nose, bottom center',
  LandmarkType.LEFT_EYE_TOP_BOUNDARY: 'Left eye, top boundary',
  LandmarkType.LEFT_EYE_RIGHT_CORNER: 'Left eye, right corner',
  LandmarkType.LEFT_EYE_BOTTOM_BOUNDARY: 'Left eye, bottom bound',
  LandmarkType.LEFT_EYE_LEFT_CORNER: 'Left eye, left corner',
  LandmarkType.RIGHT_EYE_TOP_BOUNDARY: 'Right eye, top boundary',
  LandmarkType.RIGHT_EYE_RIGHT_CORNER: 'Right eye, right corner',
  LandmarkType.RIGHT_EYE_BOTTOM_BOUNDARY: 'Right eye, bottom boundary',
  LandmarkType.RIGHT_EYE_LEFT_CORNER: 'Right eye, left corner',
  LandmarkType.LEFT_EYEBROW_UPPER_MIDPOINT: 'Left eyebrow, upper midpoint',
  LandmarkType.RIGHT_EYEBROW_UPPER_MIDPOINT: 'Right eyebrow, upper midpoint',
  LandmarkType.LEFT_EAR_TRAGION: 'Left ear tragion',
  LandmarkType.RIGHT_EAR_TRAGION: 'Right ear tragion',
  LandmarkType.LEFT_EYE_PUPIL: 'Left eye pupil',
  LandmarkType.RIGHT_EYE_PUPIL: 'Right eye pupil',
  LandmarkType.FOREHEAD_GLABELLA: 'Forehead glabella',
  LandmarkType.CHIN_GNATHION: 'Chin gnathion',
  LandmarkType.CHIN_LEFT_GONION: 'Chin left gonion',
  LandmarkType.CHIN_RIGHT_GONION: 'Chin right gonion',
  LandmarkType.LEFT_CHEEK_CENTER: 'Left cheek center',
  LandmarkType.RIGHT_CHEEK_CENTER: 'Right cheek center',
};
