import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pinput/pinput.dart';

class OtpGlassContain extends StatefulWidget {
  const OtpGlassContain({super.key});

  @override
  State<OtpGlassContain> createState() => _OtpGlassContainState();
}

class _OtpGlassContainState extends State<OtpGlassContain> {
  final defaultPinTheme = PinTheme(height: 1.h, width: 1.h);

  final otpcontroller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    otpcontroller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      height: 5.5.h,
      width: 5.5.h,
      textStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: 1),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 130, 130, 130),
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return GlassContainer.frostedGlass(
      //inner glass container
      height: 88.h,
      width: 90.w,
      blur: 11,
      borderRadius: BorderRadius.circular(25),
      borderColor: Colors.white38,
      color: Colors.white24,
      child: Column(
        //column in which inner childrens is placed
        mainAxisSize: MainAxisSize.min,
        children: [
          //for gapping
          SizedBox(
            height: 7.h,
          ),
          //logo of  the cafe
          Image.asset("assets/otp1.png"),
          SizedBox(
            height: 5.h,
          ),

          //swift cafe end
          Text(
            "Verification Code",
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Enter Your OTP",
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 3.h,
          ),
          Pinput(
            length: 6,
            controller: otpcontroller,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
            onSubmitted: ((value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/page2", (route) => false);
            }),
            pinAnimationType: PinAnimationType.fade,
            animationDuration: Duration(milliseconds: 15),
            animationCurve: Curves.bounceInOut,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            obscureText: true,
            obscuringCharacter: "*",
            keyboardType: TextInputType.number,
            useNativeKeyboard: true,
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn’t receive the OTP?",
                style: GoogleFonts.inter(
                    color: Colors.white54,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'RESEND',
                  style: GoogleFonts.inter(
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1),
                ),
                style: TextButton.styleFrom(),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/page2", (route) => false);
            },
            child: Container(
              height: 7.7.h,
              width: 55.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage("assets/loginbutton.png"),
                      fit: BoxFit.fill)),
              child: Center(
                child: Text(
                  "Submit",
                  style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),

          // //user name field
        ],
      ),
    );
  }
}