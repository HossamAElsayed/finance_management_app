import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Creates a new color with the given values replaced.
  /// If a value is null, the original value is used.
  Color withValues({int? red, int? green, int? blue, double? alpha}) {
    return Color.fromRGBO(
      red ?? ((r * 255.0).round() & 0xff),
      green ?? ((g * 255.0).round() & 0xff),
      blue ?? ((b * 255.0).round() & 0xff),
      alpha ?? ((a * 255.0).round() & 0xff).toDouble(),
    );
  }
}
