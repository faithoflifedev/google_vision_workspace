import 'dart:ui';

import 'package:google_vision_flutter/google_vision_flutter.dart';

/// Extension methods for the [Vertex] class.
extension VertexExt on Vertex {
  /// adjust the offset to the size of the displayed image
  Offset toResizedOffset({double heightRatio = 1, double widthRatio = 1}) =>
      Offset(x.toDouble() * widthRatio, y.toDouble() * heightRatio);

  Offset toOffset() => toResizedOffset();
}

/// Extension methods for the [NormalizedVertex] class.
extension VertexNormalizedExt on NormalizedVertex {
  /// [size] is the size of the image when displayed
  Offset toResizedOffset(Size size) =>
      Offset(x.toDouble() * size.width, y.toDouble() * size.height);
}
