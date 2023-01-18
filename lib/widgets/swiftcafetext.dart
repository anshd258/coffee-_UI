import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class swift_cafe_text extends StatelessWidget {
  const swift_cafe_text({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        //swift cafe Text with Styling
        children: [
          Text(
            "Swift",
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            "Cafe",
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
