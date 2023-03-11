///Integrates Google Vision features, including image labeling, face, logo, and
///landmark detection, optical character recognition (OCR), and detection of
///explicit content, into applications.
library google_vision;

export 'src/google_vision_base.dart';
export 'src/token_generator.dart';

export 'src/cmd/vision_crop_hint_command.dart';
export 'src/cmd/vision_detect_command.dart';
export 'src/cmd/vision_helper_command.dart';
export 'src/cmd/vision_highlight_command.dart';
export 'src/cmd/vision_safe_search_command.dart';
export 'src/cmd/vision_score_command.dart';

export 'src/model/annotate_image_response.dart';
export 'src/model/annotated_responses.dart';
export 'src/model/annotation_request.dart';
export 'src/model/annotation_requests.dart';
export 'src/model/bounding_poly.dart';
export 'src/model/color_info.dart';
export 'src/model/color.dart';
export 'src/model/crop_hint.dart';
export 'src/model/crop_hints_annotation.dart';
export 'src/model/crop_hints_params.dart';
export 'src/model/detected_break.dart';
export 'src/model/detected_language.dart';
export 'src/model/dominant_colors_annotation.dart';
export 'src/model/entity_annotation.dart';
export 'src/model/face_annotation.dart';
export 'src/model/face_recognition_params.dart';
export 'src/model/feature.dart';
export 'src/model/full_text_annotation.dart';
export 'src/model/image_annotation_context.dart';
export 'src/model/image_context.dart';
export 'src/model/image_properties_annotation.dart';
export 'src/model/image.dart';
export 'src/model/json_settings.dart';
export 'src/model/jwt_credentials.dart';
export 'src/model/landmark.dart';
export 'src/model/lat_lng.dart';
export 'src/model/localized_object_annotation.dart';
export 'src/model/location_info.dart';
export 'src/model/normalized_vertex.dart';
export 'src/model/page.dart';
export 'src/model/position.dart';
export 'src/model/product_search_params.dart';
export 'src/model/property.dart';
export 'src/model/safe_search_annotation.dart';
export 'src/model/status.dart';
export 'src/model/text_annotation.dart';
export 'src/model/text_detection_params.dart';
export 'src/model/text_property.dart';
export 'src/model/token.dart';
export 'src/model/vertex.dart';
export 'src/model/web_detection_params.dart';

export 'src/provider/oauth.dart';
export 'src/provider/vision.dart';

export 'src/util/painter.dart';
export 'src/util/serializable_image.dart';
export 'src/util/util.dart';
