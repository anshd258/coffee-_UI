import 'package:flutter/material.dart';
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
    final phonenumber = context.watch<LoginAuthProvider>().phoneNumber;
    if (phonenumber == null) {
      return const page_1();
    } else {
      if (role == "admin") {
        return const AdminHome();
      } else {
        return const Toggle();
      }
    }
  }
}
