import 'package:flutter/material.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/page/Merchent/toggle_merchant.dart';
import 'package:inter_coffee/page/page-1.dart';
import 'bottombartoggle.dart';
import 'package:provider/provider.dart';
import '../provider/loginAuthProvider.dart';

class Switcher extends StatelessWidget {
  const Switcher({super.key});

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    isAdmin = context.watch<LoginAuthProvider>().getColor == null
        ? false
        : context.watch<LoginAuthProvider>().getColor!;
    print("this is switcherpage role -> $role");
    print("this is switcherpage color -> $isAdmin");

    if (role == null) {
      return const page_1();
    } else {
      if (role == "merchant") {
        return const ToggleMerchant();
      } else {
        return const Toggle();
      }
    }
  }
}
