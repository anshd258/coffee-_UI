import 'dart:math';
import 'package:inter_coffee/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider/router.dart';

class Profilepgbottom extends StatefulWidget {
  const Profilepgbottom({super.key});

  @override
  State<Profilepgbottom> createState() => _ProfilepgbottomState();
}

class _ProfilepgbottomState extends State<Profilepgbottom> {
  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      height: 30.h,
      width: 90.w,
      borderWidth: 1,
      blur: 17,
      frostedOpacity: 0.04,
      // color: Color.fromARGB(60, 255, 255, 255),
      gradient: LinearGradient(
          colors: glassShadeMyAccounts,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      borderColor: Colors.white24,
      borderRadius: BorderRadius.circular(10),
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
      margin: EdgeInsets.only(top: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 3.w,
              ),
              Icon(
                Icons.bookmark_sharp,
                size: 20.sp,
                color: Colors.white70,
              ),
              SizedBox(
                width: 1.w,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 0.4.h,
                  ),
                  Text(
                    "More",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
          SizedBox(
            width: 85.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GlassContainer.frostedGlass(
                      height: 4.h,
                      width: 4.h,
                      borderColor: Colors.white12,
                      shape: BoxShape.circle,
                      elevation: 3,
                      shadowColor: Colors.white70,
                      child: Image.asset("assets/ICONS/about2.png",
                          color: Colors.white, scale: 0.22.h),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "About",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Transform.rotate(
                      angle: pi / 180 * 180,
                      child: Image.asset(
                        "assets/ICONS/arrow3.png",
                        scale: 3,
                      )),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white70,
            endIndent: 5.w,
            indent: 5.w,
            height: 2.5.h,
          ),
          SizedBox(
            width: 85.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GlassContainer.frostedGlass(
                      height: 4.h,
                      width: 4.h,
                      shape: BoxShape.circle,
                      borderColor: Colors.white12,
                      elevation: 3,
                      shadowColor: Colors.white70,
                      child: Image.asset("assets/ICONS/feedb2.png",
                          color: Colors.white, scale: 0.25.h),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "Send Feedback",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Transform.rotate(
                      angle: pi / 180 * 180,
                      child: Image.asset(
                        "assets/ICONS/arrow3.png",
                        scale: 3,
                      )),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white70,
            endIndent: 5.w,
            indent: 5.w,
            height: 2.5.h,
          ),
          SizedBox(
            width: 85.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GlassContainer.frostedGlass(
                      height: 4.h,
                      width: 4.h,
                      borderColor: Colors.white12,
                      shape: BoxShape.circle,
                      elevation: 3,
                      shadowColor: Colors.white70,
                      child: Image.asset("assets/ICONS/test2.png",
                          color: Colors.white, scale: 0.22.h),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "Report a safety emergency",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Transform.rotate(
                      angle: pi / 180 * 180,
                      child: Image.asset(
                        "assets/ICONS/arrow3.png",
                        scale: 3,
                      )),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white70,
            endIndent: 5.w,
            indent: 5.w,
            height: 2.5.h,
          ),
          GestureDetector(
            onTap: () {
              context.read<routing>().settingroute = 1;
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
            child: Container(
              color: Colors.transparent,
              width: 85.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlassContainer.frostedGlass(
                        height: 4.h,
                        width: 4.h,
                        shape: BoxShape.circle,
                        elevation: 3,
                        borderColor: Colors.white12,
                        shadowColor: Colors.white70,
                        padding: EdgeInsets.all(1.w),
                        child: Image.asset("assets/ICONS/logout2.png",
                            color: Colors.white,
                            scale: 0.23.h,
                            alignment: Alignment.centerRight),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "Logout",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Transform.rotate(
                      angle: pi / 180 * 180,
                      child: Image.asset(
                        "assets/ICONS/arrow3.png",
                        scale: 3,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
