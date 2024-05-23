import 'package:flutter/material.dart';

class IconWithCircle extends StatelessWidget {
  const IconWithCircle(
      {super.key, required this.circleColor, required this.icon});

  final Color circleColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: circleColor, //Colors.white.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: icon,
        ));
  }
}
