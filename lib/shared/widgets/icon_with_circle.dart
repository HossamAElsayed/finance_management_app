import 'package:flutter/material.dart';

class IconWithCircle extends StatelessWidget {
  const IconWithCircle({
    super.key,
    required this.circleColor,
    required this.icon,
    this.size = 50,
  });

  final Color circleColor;
  final Icon icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
      child: Center(
        child: Padding(padding: EdgeInsets.all(size * 0.2), child: icon),
      ),
    );
  }
}
