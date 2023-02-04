import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import './swiftcafetext.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class glass_container extends StatelessWidget {
  TextEditingController ctr = TextEditingController();
  glass_container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      //inner glass container
      height: 88.h,
      width: 90.w,
      blur: 14,
      frostedOpacity: 0.04,

      borderRadius: BorderRadius.circular(25),
      color: const Color.fromARGB(36, 255, 255, 255),

      borderColor: Colors.white38,
      child: Column(
        //column in which inner childrens is placed
        mainAxisSize: MainAxisSize.min,
        children: [
          //for gapping
          SizedBox(
            height: 7.h,
          ),
          //logo of  the cafe
          Image.asset("assets/logo.png", scale: 0.75),
          SizedBox(
            height: 0.5.h,
          ),
          //swift cafe begin
          const swift_cafe_text(), //swift cafe TEXT
          //swift cafe end
          SizedBox(
            height: 1.h,
          ),
          GlowText(
            '"Latte but never late"',
            textAlign: TextAlign.center,
            blurRadius: 15,
            glowColor: const Color.fromRGBO(171, 171, 171, 1),
            style: GoogleFonts.poppins(
              color: const Color.fromRGBO(171, 171, 171, 1),
              fontSize: 16.sp,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          //latte but never late end here
          //for gapping
          // TextField(
          //   style: TextStyle(color: Colors.white),
          //   cursorColor: Colors.white,
          //   decoration: InputDecoration(
          //     enabledBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //       color: Colors.white,
          //     )),
          //     focusedBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //       color: Colors.white,
          //     )),
          //     hintText: "User Name",
          //     hintStyle: TextStyle(color: Colors.white, fontSize: 13),
          //     fillColor: Colors.transparent,
          //     filled: true,
          //     constraints: BoxConstraints(maxHeight: 9.h, maxWidth: 75.w),
          //   ),
          // ),
          // //user name field

          TextField(
            // obscureText: true,
            // obscuringCharacter: "*",
            controller: ctr,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              hintText: "Phone Number",
              hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
              fillColor: Colors.transparent,
              filled: true,
              constraints: BoxConstraints(maxHeight: 9.h, maxWidth: 75.w),
            ),
          ),
          //password input field
          SizedBox(
            height: 10.h,
          ),
          // login button
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/otpinput", (route) => false,
                  arguments: ctr.text);
            },
            child: Container(
              height: 7.7.h,
              width: 55.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage("assets/loginbutton.png"),
                      fit: BoxFit.fill)),
              child: Center(
                child: Text(
                  "Submit",
                  style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
          //gapping
          SizedBox(
            height: 2.h,
          ),
          //signup button
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context,
          //         "/page2"); //navigating to 2nd page when the button is clicked
          //   },
          //   style: OutlinedButton.styleFrom(
          //     side: const BorderSide(
          //       color: Colors.white,
          //     ),
          //     fixedSize: Size(55.w, 6.5.h),
          //     foregroundColor: Colors.white,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //   ),
          //   child: Text(
          //     "Signup",
          //     style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
          //   ),
          // ),
          //gapping
          SizedBox(
            height: 2.h,
          ),
          //privacy policy textbutton
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    "/otpinput"); //navigating to 2nd page when the button is clicked
              },
              child: Text(
                "Privacy Policy",
                style: GoogleFonts.inter(color: Colors.white, fontSize: 17.sp),
              )),
        ],
      ),
    );
  }
}
