// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceAnnotation _$FaceAnnotationFromJson(Map<String, dynamic> json) =>
    FaceAnnotation(
      boundingPoly: BoundingPoly.fromJson(
        json['boundingPoly'] as Map<String, dynamic>,
      ),
      fdBoundingPoly: BoundingPoly.fromJson(
        json['fdBoundingPoly'] as Map<String, dynamic>,
      ),
      landmarks: (json['landmarks'] as List<dynamic>)
          .map((e) => Landmark.fromJson(e as Map<String, dynamic>))
          .toList(),
      rollAngle: (json['rollAngle'] as num).toDouble(),
      panAngle: (json['panAngle'] as num).toDouble(),
      tiltAngle: (json['tiltAngle'] as num).toDouble(),
      detectionConfidence: (json['detectionConfidence'] as num).toDouble(),
      landmarkingConfidence: (json['landmarkingConfidence'] as num).toDouble(),
      enumJoyLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['joyLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
      enumSorrowLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['sorrowLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
      enumAngerLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['angerLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
      enumSurpriseLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['surpriseLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
      enumUnderExposedLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['underExposedLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
      enumBlurredLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['blurredLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
      enumHeadwearLikelihood: $enumDecode(
        _$LikelihoodEnumMap,
        json['headwearLikelihood'],
        unknownValue: Likelihood.UNKNOWN,
      ),
    );

Map<String, dynamic> _$FaceAnnotationToJson(
  FaceAnnotation instance,
) => <String, dynamic>{
  'boundingPoly': instance.boundingPoly.toJson(),
  'fdBoundingPoly': instance.fdBoundingPoly.toJson(),
  'landmarks': instance.landmarks.map((e) => e.toJson()).toList(),
  'rollAngle': instance.rollAngle,
  'panAngle': instance.panAngle,
  'tiltAngle': instance.tiltAngle,
  'detectionConfidence': instance.detectionConfidence,
  'landmarkingConfidence': instance.landmarkingConfidence,
  'joyLikelihood': _$LikelihoodEnumMap[instance.enumJoyLikelihood]!,
  'sorrowLikelihood': _$LikelihoodEnumMap[instance.enumSorrowLikelihood]!,
  'angerLikelihood': _$LikelihoodEnumMap[instance.enumAngerLikelihood]!,
  'surpriseLikelihood': _$LikelihoodEnumMap[instance.enumSurpriseLikelihood]!,
  'underExposedLikelihood':
      _$LikelihoodEnumMap[instance.enumUnderExposedLikelihood]!,
  'blurredLikelihood': _$LikelihoodEnumMap[instance.enumBlurredLikelihood]!,
  'headwearLikelihood': _$LikelihoodEnumMap[instance.enumHeadwearLikelihood]!,
};

const _$LikelihoodEnumMap = {
  Likelihood.UNKNOWN: 'UNKNOWN',
  Likelihood.VERY_UNLIKELY: 'VERY_UNLIKELY',
  Likelihood.UNLIKELY: 'UNLIKELY',
  Likelihood.POSSIBLE: 'POSSIBLE',
  Likelihood.LIKELY: 'LIKELY',
  Likelihood.VERY_LIKELY: 'VERY_LIKELY',
};
