import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({super.key});

  @override
  State<OrderConfirmed> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: const EdgeInsets.all(0),
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
          padding: const EdgeInsets.all(0),
          frostedOpacity: 0.05,
          borderWidth: 0,
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.43),
                Color.fromRGBO(0, 0, 0, 0.85)
              ]),
          borderColor: Colors.transparent,
          child: Scaffold(
            backgroundColor: Colors.black38,
            appBar: AppBar(
              titleSpacing: 0,
              leadingWidth: 14.w,
              title: Text("Account",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500)),
              backgroundColor: const Color.fromRGBO(77, 68, 64, 0.36),
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
              ),
              // backgroundColor: Colors.white12,
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
                  borderColor: Colors.white12,
                  frostedOpacity: 0.05,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          top: 5.h
                        ),
                        child: Image.asset("assets/check.png"),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            top: 3.h
                          ),
                          child: Text(
                            "Order Confirmed",
                            style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/OrdersAdmin");
                        },
                        child: Text(
                              "Go back to Orders",
                              style: GoogleFonts.inter(
                                          decoration: TextDecoration.underline,
                                          color: white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                            ),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
