import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class AccountAdmin extends StatefulWidget {
  const AccountAdmin({super.key});

  @override
  State<AccountAdmin> createState() => _AccountAdminState();
}

class _AccountAdminState extends State<AccountAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.all(0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/AdminBG.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.frostedGlass(
          height: 100.h,
          width: 100.w,
          blur: 17,
          padding: EdgeInsets.all(0),
          frostedOpacity: 0.05,
          borderWidth: 0,
          color: const Color.fromRGBO(0, 0, 0, 0.36),
          borderColor: Colors.transparent,
          child: Scaffold(
            backgroundColor: Colors.black38,
            appBar: AppBar(
              titleSpacing: 0,
              leadingWidth: 14.w,
              title: Text("Order Status",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600)),
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
              ),
              backgroundColor: Colors.white12,
            ),
            body: Center(
              child: GlassContainer.frostedGlass(
                  margin: EdgeInsets.only(bottom: 23.h),
                  height: 60.h,
                  width: 85.w,
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 0.5,
                  blur: 17,
                  frostedOpacity: 0.05,
                  child: Column(
                    children: [
                      Align(
                        child: Container(
                          height: 15.h,
                          width: 15.h,
                          margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/user.jpeg"))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 13.h,
                          width: 75.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 30.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name :",
                                        style: GoogleFonts.inter(
                                            color: Colors.white70,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Email ID :",
                                        style: GoogleFonts.inter(
                                            color: Colors.white70,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Access Type :",
                                        style: GoogleFonts.inter(
                                            color: Colors.white70,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Joshua Scanlan",
                                        style: GoogleFonts.inter(
                                            color: Colors.white70,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "joshuascanlan@gmail.com",
                                        style: GoogleFonts.inter(
                                            color: Colors.white70,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Admin",
                                        style: GoogleFonts.inter(
                                            color: Colors.white70,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
