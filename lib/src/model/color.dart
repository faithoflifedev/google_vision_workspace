import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'color.g.dart';

/// Represents a color in the RGBA color space. This representation is designed
/// for simplicity of conversion to/from color representations in various
/// languages over compactness. For example, the fields of this representation
/// can be trivially provided to the constructor of java.awt.Color in Java; it
/// can also be trivially provided to UIColor's +colorWithRed:green:blue:alpha
/// method in iOS; and, with just a little work, it can be easily formatted into
/// a CSS rgba() string in JavaScript.
///
/// This reference page doesn't carry information about the absolute color space
/// that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
/// DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB
/// color space.
///
/// When color equality needs to be decided, implementations, unless documented
/// otherwise, treat two colors as equal if all their red, green, blue, and
/// alpha values each differ by at most 1e-5.
@JsonSerializable()
class Color {
  /// The amount of red in the color as a value in the interval \[0, 1\].
  final double red;

  /// The amount of green in the color as a value in the interval \[0, 1\].
  final double green;

  /// The amount of blue in the color as a value in the interval \[0, 1\].
  final double blue;

  /// The amount of alpha in the color as a value in the interval \[0, 1\].
  final double? alpha;

  Color({
    required this.red,
    required this.green,
    required this.blue,
    this.alpha,
  });

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
