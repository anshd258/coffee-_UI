import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/profilepgmid.dart';
import '../widgets/profilepgbottomcard.dart';

class Profilepg extends StatefulWidget {
  const Profilepg({super.key});

  @override
  State<Profilepg> createState() => _ProfilepgState();
}

class _ProfilepgState extends State<Profilepg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bg1.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.clearGlass(
        blur: 10,
        height: 100.h,
        width: 100.w,
        borderWidth: 0,
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("My Account ",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 17.sp)),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            backgroundColor: Colors.white24,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GlassContainer.clearGlass(
                height: 15.h,
                width: 90.w,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 0.5,
                margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3.h),
                            Text(
                              "Joshua Scanlan",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "Joshuascanlan@abc.com",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 12.h,
                      width: 22.w,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                          image: DecorationImage(
                              image: AssetImage("assets/user.jpeg"))),
                    )
                  ],
                ),
              ),
              const ProfilepgMid(),
              const Profilepgbottom()
            ],
          )),
        ),
      ),
    );
  }
}
