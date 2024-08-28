/// A Flutter plugin for Google Vision API.
library google_vision_flutter;

export 'src/extensions.dart';
export 'src/google_vision.dart';
export 'src/google_vision_builder_base.dart';
export 'src/google_vision_builder.dart';
export 'src/google_vision_file_builder.dart';
export 'src/google_vision_future_resolver.dart';
export 'src/google_vision_image_builder.dart';
export 'src/image_detail.dart';
export 'src/input_config.dart';
export 'src/json_image.dart';

export 'package:google_vision/google_vision.dart'
    hide Color, GoogleVision, JsonImage, InputConfig;
