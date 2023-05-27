import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class MerchantNavBar extends StatefulWidget {
  const MerchantNavBar({super.key});

  @override
  State<MerchantNavBar> createState() => _MerchantNavBarState();
}

class _MerchantNavBarState extends State<MerchantNavBar> {
  //for managing the state

  //bool value for indicating is that pagee on scree

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().userRole;
    final val = context.watch<routing>().gettingroute;
    //switch case for bottom navigaton bar

    return GlassContainer.clearGlass(
      margin: const EdgeInsets.all(20),
      height: 6.5.h,
      width: 90.w,
      blur: 15,
      alignment: Alignment.center,
      color: Theme.of(context).bottomAppBarTheme.color,
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
                  color: val == 1
                      ? Theme.of(context).bottomAppBarTheme.surfaceTintColor
                      : Colors.transparent,
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
                  color: val == 2
                      ? Theme.of(context).bottomAppBarTheme.surfaceTintColor
                      : Colors.transparent,
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
                  color: val == 3
                      ? Theme.of(context).bottomAppBarTheme.surfaceTintColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 3 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/table.png",
                fit: BoxFit.scaleDown,
                scale: 1.5,
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
                  color: val == 4
                      ? Theme.of(context).bottomAppBarTheme.surfaceTintColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 4 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/notification.png",
                fit: BoxFit.scaleDown,
                scale: 2.7,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<routing>().settingRoute(5);
              setState(() {});
            },
            child: Container(
              height: 4.5.h,
              width: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: val == 5
                      ? Theme.of(context).bottomAppBarTheme.surfaceTintColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.4,
                    color: val == 5 ? Colors.white : Colors.transparent,
                  )),
              child: Image.asset(
                "assets/coffee_cup.png",
                fit: BoxFit.scaleDown,
                scale: 0.95,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
