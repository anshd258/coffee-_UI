import 'dart:math';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/set_cafe_timings.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreenMidContainer extends StatelessWidget {
  const ProfileScreenMidContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    return GlassContainer.frostedGlass(
      height: 17.h,
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
                    "Food Orders",
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
            height: 1.h,
          ),
          if (role != 'merchant') ...[
            GestureDetector(
              onTap: () async {
                Navigator.pushNamed(context, orderHistoryScreen);
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
                          child: Image.asset(
                            "assets/milk1.png",
                            fit: BoxFit.scaleDown,
                            scale: 1.8,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Your Orders",
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
            Divider(
              color: Colors.white70,
              endIndent: 5.w,
              indent: 5.w,
              height: 2.5.h,
            ),
          ],
          GestureDetector(
            onTap: () {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'support@trackmile.com.au',
              );

              launchUrl(emailLaunchUri);
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
                        child: Image.asset(
                          "assets/cup1.png",
                          fit: BoxFit.scaleDown,
                          scale: 1.8,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "Help",
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
          if( role == "merchant" ) ...[
            Divider(
              color: Colors.white70,
              endIndent: 5.w,
              indent: 5.w,
              height: 2.5.h,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.pushNamed(context, merchantSetTime);
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
                          child: Image.asset(
                            "assets/cup1.png",
                            fit: BoxFit.scaleDown,
                            scale: 1.8,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Set Cafe Timings",
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
          ]
        ],
      ),
    );
  }
}
