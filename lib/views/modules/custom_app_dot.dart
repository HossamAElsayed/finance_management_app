import 'package:flutter/material.dart';

class CustomAppDot extends StatelessWidget {
  final Color color;
  final double size;

  const CustomAppDot({
    super.key,
    required this.color,
    this.size = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
