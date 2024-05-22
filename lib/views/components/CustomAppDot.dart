import 'package:flutter/material.dart';

class CustomAppDot extends StatelessWidget {
  final double dotSize;
  final Color dotColor;

  const CustomAppDot({
    required this.dotSize,
    required this.dotColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: dotSize,
      backgroundColor: dotColor,
    );
  }
}
