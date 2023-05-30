import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/colors.dart';

Future<void> orderCompletionDialog(BuildContext context, int route) async {
  final role = Provider.of<LoginAuthProvider>(context, listen: false).role;
  var timer = Timer(const Duration(milliseconds: 3000), () {
    context.read<routing>().settingRoute(route);

    if (role == "merchant") {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  });
  // Future.delayed(
  //   const Duration(milliseconds: 1000),
  //   () {
  //     // context.read<routing>().settingRoute(1);
  //     // Navigator.pop(context);
  //     context.read<routing>().settingRoute(route);

  //     if (role == "merchant") {
  //       Navigator.pop(context);
  //     } else {
  //       Navigator.pop(context);
  //     }
  //   },
  // );
  return await showDialog(
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.75),
    barrierDismissible: false,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return WillPopScope(
          onWillPop: () async {
            timer.cancel();
            Navigator.pop(context);
            print("caught back button press->");
            return false;
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0),
            child: SizedBox(
              width: 100.w,
              height: 90.h,
              child: Align(
                alignment: Alignment.center,
                child: GlassContainer.frostedGlass(
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 0.5,
                  // color: Color.fromARGB(40, 255, 255, 255),
                  gradient: LinearGradient(
                      colors: glassShadeConfirmOrder,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderColor: Colors.white38,
                  frostedOpacity: 0.04,
                  margin: EdgeInsets.only(top: 2.8.h),
                  height: 55.h,
                  width: 85.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 54.h,
                        width: 84.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 35.h,
                                alignment: Alignment.centerRight,
                                width: 65.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/cp1.png",
                                        ),
                                        fit: BoxFit.contain)),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  height: 10.h,
                                  width: 20.w,
                                  child: Image.asset("assets/greencheck.png",
                                      scale: 1),
                                )),
                            Column(
                              children: [
                                Text(
                                  "Order Completed Successfully!",
                                  style: GoogleFonts.inter(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(55, 173, 84, 1)),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SizedBox(
                                  width: 75.w,
                                  child: Text(
                                    "Please wait for your order until ready to pickup.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Thank You",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.sp,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
