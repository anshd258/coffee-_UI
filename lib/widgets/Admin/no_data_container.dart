import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoDataContainer extends StatelessWidget {
  const NoDataContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        alignment: Alignment.center,
        child: Text(
          "No Data Avilabe",
          style: GoogleFonts.quicksand(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70),
        ));
  }
}
