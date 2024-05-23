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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundImage: NetworkImage(currentUser.image),
      ),
      title: Text(
        "Welcome Back",
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text(
        currentUser.name,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Colors.white),
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
        Icon(
          Iconsax.notification,
          size: 25,
          color: Theme.of(context).scaffoldBackgroundColor,
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
          ),
        ),
      ],
    );
  }
}
