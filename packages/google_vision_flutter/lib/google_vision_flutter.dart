/// A Flutter plugin for Google Vision API.
library google_vision_flutter;

export 'src/extensions.dart';
export 'src/google_vision.dart';
export 'src/google_vision_builder.dart';
export 'src/image_detail.dart';
export 'src/json_image.dart';

export 'package:google_vision/google_vision.dart'
    hide GoogleVision, JsonImage, Color;
