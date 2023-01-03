import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class swift_cafe_text extends StatelessWidget {
  const swift_cafe_text({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19.h,
      width: 50.w,
      child: Column(
        children: [
          Text(
            "Swift",
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 55,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            "Cafe",
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
