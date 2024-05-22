import 'package:finance_management_app/views/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeUserTile extends StatelessWidget {
  const HomeUserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.zero,

      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(currentUser.image),
      ),
      title: const Text(
        "Welcome Back",
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
      ),
      subtitle: Text(
        currentUser.name,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: const CustomNotificationIcon(),
    );
  }
}

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(
          Iconsax.notification,
          size: 25,
          color: Colors.white,
        ),
        Positioned(
          right: 3,
          top: 2,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 8,
              minHeight: 8,
            ),
            // child: Text(
            //   '3',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 12,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ),
        ),
      ],
    );
  }
}
