import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../provider/router.dart';

import '../provider/loginAuthProvider.dart';

class Pg2BottonavBar extends StatefulWidget {
  const Pg2BottonavBar({super.key});

  @override
  State<Pg2BottonavBar> createState() => _Pg2BottonavBarState();
}

class _Pg2BottonavBarState extends State<Pg2BottonavBar> {
  //for managing the state

  //bool value for indicating is that pagee on scree

  @override
  Widget build(BuildContext context) {
    bool page1 = true;

    final role = context.watch<LoginAuthProvider>().userRole;
    final val = context.watch<routing>().gettingroute;
    //switch case for bottom navigaton bar

    return GlassContainer.clearGlass(
      margin: const EdgeInsets.all(20),
      height: 6.5.h,
      width: 90.w,
      blur: 15,
      alignment: Alignment.center,
      color: bottomNavBarBG,
      // color: Colors.black38,
      borderColor: Colors.transparent,
      borderRadius: const BorderRadius.all(
        Radius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.read<routing>().settingRoute(1);
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: val == 1 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 1 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/home.png",
                fit: BoxFit.scaleDown,
                scale: 2.5,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<routing>().settingRoute(2);
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: val == 2 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 2 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/user.png",
                fit: BoxFit.scaleDown,
                scale: 2,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<routing>().settingRoute(3);
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: val == 3 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 3 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/notification.png",
                fit: BoxFit.scaleDown,
                scale: 2.3,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<routing>().settingRoute(4);
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: val == 4 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 4 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/cart.png",
                fit: BoxFit.scaleDown,
                scale: 2.7,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (role == "merchant" && role != null) {
                context.read<routing>().settingRoute(5);
              } else if (role == 'admin' && role != null) {
                context.read<routing>().settingRoute(6);
              }

              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: val == 5 || val == 6
                      ? bottomNavBarItem
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 5 || val == 6
                        ? Colors.white
                        : Colors.transparent,
                  )),
              child: role == "admin"
                  ? Image.asset(
                      "assets/Priority.png",
                      fit: BoxFit.scaleDown,
                      scale: 2.5,
                      color: Colors.white,
                    )
                  : Image.asset(
                      "assets/new.png",
                      fit: BoxFit.scaleDown,
                      scale: 2,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
