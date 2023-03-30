import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'swift_cafe_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginGlassContainer extends StatelessWidget {
  TextEditingController ctr = TextEditingController();
  LoginGlassContainer({
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
          const SwiftCafeText(), //swift cafe TEXT
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
          TextField(
            // obscureText: true,
            // obscuringCharacter: "*",
            controller: ctr,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            keyboardType: TextInputType.phone,
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
              if (context
                  .read<LoginAuthProvider>()
                  .verifyPhoneNumber(ctr.text, context)) {
                context.read<LoginAuthProvider>().getOtp(ctr.text, context);
              }
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

          //gapping
          SizedBox(
            height: 2.h,
          ),
          //privacy policy textbutton
          TextButton(
              onPressed: () async {
                final urli = Uri(
                  path: "/",
                  scheme: "https",
                  host: "privacy.swift-cafe-dev.swifttrackmile.codes",
                );
                if (await canLaunchUrl(urli)) {
                  print(urli);
                  await launchUrl(
                    urli,
                    mode: LaunchMode.externalApplication,
                  );
                }
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
