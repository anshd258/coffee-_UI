import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Container headerContainer(String? header) {
  return Container(
    padding: EdgeInsets.all(2.w),
    height: 5.h,
    decoration: BoxDecoration(
      color: tableBlack,
      border: Border.all(color: borderWhite),
    ),
    child: FittedBox(
      fit: BoxFit.contain,
      child: Center(
        child: Text(
          header.toString(),
          textAlign: TextAlign.start,
          style: GoogleFonts.inter(color: white, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
