import 'dart:math';

import 'package:finance_management_app/models/user.dart';
import 'package:flutter/material.dart';

class Constants {
  static const primaryColor = Colors.blueAccent;
}

const User currentUser = User(
  id: 0,
  name: 'Steven Paul',
  email: 'paul@info.com',
  image:
      'https://img.freepik.com/free-psd/3d-render-avatar-character_23-2150611756.jpg?w=740&t=st=1716308921~exp=1716309521~hmac=9510b712dbd12f3c824e44f34d69a80c04bb99afc18992b02f14c09972810e24',
);

// Generate a list of random expenses
final List<double> expenses =
    List.generate(10, (_) => Random.secure().nextDouble() * (900) + 100);
// Calculate the expenses for the last 7 day
final List<double> weeklyExpenses =
    expenses.sublist(expenses.length - 7, expenses.length);
