import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/page/page-2.dart';
import 'package:nice_buttons/nice_buttons.dart';
import './swiftcafetext.dart';

class glass_container extends StatelessWidget {
  const glass_container({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      height: size.height - 100,
      width: size.width - 50,
      blur: 9,
      borderRadius: BorderRadius.circular(25),
      borderColor: Colors.white38,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 57,
          ),
          Image.asset("assets/logo.png"),
          //swift cafe begin
          swift_cafe_text(),
          //swift cafe end
          GlowText(
            '"Latte but never late"',
            textAlign: TextAlign.center,
            blurRadius: 15,
            glowColor: const Color.fromRGBO(171, 171, 171, 1),
            style: GoogleFonts.poppins(
              color: const Color.fromRGBO(171, 171, 171, 1),
              fontSize: 14,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
          //latte but never late end here
          const SizedBox(height: 20),
          const TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              hintText: "User Name",
              hintStyle: TextStyle(color: Colors.white, fontSize: 13),
              fillColor: Colors.transparent,
              filled: true,
              constraints: BoxConstraints(maxHeight: 70, maxWidth: 265),
            ),
          ),
          //user name fiel
          SizedBox(height: 20),
          const TextField(
            obscureText: true,
            obscuringCharacter: "*",
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white, fontSize: 13),
              fillColor: Colors.transparent,
              filled: true,
              constraints: BoxConstraints(maxHeight: 70, maxWidth: 265),
            ),
          ),
          //password input field
          const SizedBox(
            height: 50,
          ),
          // login button
          NiceButtons(
            onTap: () {},
            borderRadius: 30,
            stretch: false,
            borderColor: Colors.transparent,
            width: 200,
            gradientOrientation: GradientOrientation.Horizontal,
            startColor: Color.fromARGB(255, 77, 43, 26),
            endColor: Color.fromARGB(255, 167, 116, 90),
            height: 49,
            child: Text(
              "Login",
              style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          //signup button
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/page2");
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.white,
              ),
              fixedSize: const Size(200, 49),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Signup",
              style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page2");
              },
              child: Text(
                "Privacy Policy",
                style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
              ))
        ],
      ),
    );
  }
}
