// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageContext _$ImageContextFromJson(Map<String, dynamic> json) => ImageContext(
      languageHints: (json['languageHints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cropHintsParams: json['cropHintsParams'] == null
          ? null
          : CropHintsParams.fromJson(
              json['cropHintsParams'] as Map<String, dynamic>),
      productSearchParams: json['productSearchParams'] == null
          ? null
          : ProductSearchParams.fromJson(
              json['productSearchParams'] as Map<String, dynamic>),
      webDetectionParams: json['webDetectionParams'] == null
          ? null
          : WebDetectionParams.fromJson(
              json['webDetectionParams'] as Map<String, dynamic>),
      textDetectionParams: json['textDetectionParams'] == null
          ? null
          : TextDetectionParams.fromJson(
              json['textDetectionParams'] as Map<String, dynamic>),
      faceRecognitionParams: json['faceRecognitionParams'] == null
          ? null
          : FaceRecognitionParams.fromJson(
              json['faceRecognitionParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageContextToJson(ImageContext instance) =>
    <String, dynamic>{
      'languageHints': instance.languageHints,
      'cropHintsParams': instance.cropHintsParams?.toJson(),
      'productSearchParams': instance.productSearchParams?.toJson(),
      'webDetectionParams': instance.webDetectionParams?.toJson(),
      'textDetectionParams': instance.textDetectionParams?.toJson(),
      'faceRecognitionParams': instance.faceRecognitionParams?.toJson(),
    };
