import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../components/IconWithCircle.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomHomeButton(
            icon: Icon(
              Iconsax.scan_barcode,
              color: Colors.blue,
            ),
            // circleColor: Colors.blue.withOpacity(0.1),
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            title: 'Pay or Transfer'),
        CustomHomeButton(
            icon: Icon(
              Iconsax.wallet,
              color: Colors.white,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            title: 'Add Money'),
      ],
    );
  }
}

class CustomHomeButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;

  const CustomHomeButton({
    required this.icon,
    required this.title,
    required this.foregroundColor,
    required this.backgroundColor,
    this.circleColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Wrap(
        spacing: 5,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconWithCircle(icon: icon, circleColor: circleColor.withOpacity(0.5)),
          Text(title),
        ],
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
            .copyWith(right: 18),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      onPressed: () {},
    );
  }
}
