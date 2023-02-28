import 'package:flutter/material.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/page/Merchent/toggle_merchant.dart';
import 'package:inter_coffee/page/page-1.dart';
import 'package:inter_coffee/widgets/snackbar.dart';

import 'bottombartoggle.dart';
import 'package:provider/provider.dart';
import '../provider/loginAuthProvider.dart';

class Switcher extends StatefulWidget {
  Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  Widget selector(String? role, String? tokken) {
    if (role == "null" && tokken == "null") {
      return const page_1();
    } else {
      if (role == "merchant") {
        return const ToggleMerchant();
      } else {
        return const Toggle();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<LoginAuthProvider>().autologin();
  }

  var ctime;

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    final accesstoken = context.watch<LoginAuthProvider>().accessToken;

    isAdmin = context.watch<LoginAuthProvider>().getColor == null
        ? false
        : context.watch<LoginAuthProvider>().getColor!;
    print("this is switcherpage role -> $role");
    print("this is switcherpage color -> $isAdmin");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
          child: selector(role, accesstoken),
          onWillPop: () {
            DateTime now = DateTime.now();
            if (ctime == null ||
                now.difference(ctime) > const Duration(seconds: 2)) {
              //add duration of press gap
              ctime = now;
              // snackbarWarning(context, "Press Back Button Again to Exit");
              snakbarmethod(context, "Please Double Tap To Exit");

              return Future.value(false);
            }

            return Future.value(true);
          }),
    );
  }
}
