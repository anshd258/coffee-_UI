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

  int val = 1;

  //bool value for indicating is that pagee on scree

  bool page1 = true;
  bool page2 = false;
  bool page3 = false;
  bool page4 = false;
  bool page5 = false;
  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().userRole;
    val = context.read<routing>().gettingroute;
    //switch case for bottom navigaton bar

    switch (val) {
      case 1:
        {
          page1 = true;
          page2 = false;
          page3 = false;
          page4 = false;
          page5 = false;
        }
        break;
      case 2:
        {
          page1 = false;
          page2 = true;
          page3 = false;
          page4 = false;
          page5 = false;
        }
        break;
      case 3:
        {
          page1 = false;
          page2 = false;
          page3 = true;
          page4 = false;
          page5 = false;
        }
        break;
      case 4:
        {
          page1 = false;
          page2 = false;
          page3 = false;
          page4 = true;
          page5 = false;
        }
        break;
      case 5:
        {
          page1 = false;
          page2 = false;
          page3 = false;
          page4 = false;
          page5 = true;
        }
        break;
      default:
    }

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
              val = 1;
              context.read<routing>().settingroute = val;
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: page1 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: page1 ? Colors.white : Colors.transparent,
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
              val = 2;
              context.read<routing>().settingroute = val;
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: page2 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: page2 ? Colors.white : Colors.transparent,
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
              val = 3;
              context.read<routing>().settingroute = val;
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: page3 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: page3 ? Colors.white : Colors.transparent,
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
              val = 4;
              context.read<routing>().settingroute = 4;
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: page4 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: page4 ? Colors.white : Colors.transparent,
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
              val = 5;
              if (role == "admin"&& role != null) {
                context.read<routing>().settingroute = val;
              }

              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: page5 ? bottomNavBarItem : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: page5 ? Colors.white : Colors.transparent,
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
