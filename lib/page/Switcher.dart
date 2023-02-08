import 'package:flutter/material.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/page/page-1.dart';
import 'bottombartoggle.dart';
import 'package:provider/provider.dart';
import '../provider/loginAuthProvider.dart';
import 'Admin/homepage.dart';

class Switcher extends StatelessWidget {
  const Switcher({super.key});

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    print(role);

    if (role == null) {
      isAdmin = false;
      return const page_1();
    } else {
      if (role == "admin") {
        isAdmin = true;
        return const AdminHome();
      } else {
        isAdmin = true;
        return const Toggle();
      }
    }
  }
}
