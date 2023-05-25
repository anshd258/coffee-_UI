import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DialogBox extends StatelessWidget {

  final String start;
  final String end;
  final String message;

  DialogBox({
    Key? key, 
    required this.start,
    required this.end,
    required this.message,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      height: 25.h,
      width: 80.w,
      blur: 14,
      frostedOpacity: 0.04,
      borderRadius: BorderRadius.circular(25),
      color: Colors.black54,
      padding: EdgeInsets.symmetric( vertical: 5.h, horizontal: 4.w ),
      child: SingleChildScrollView(
        child: Container(
          width: 70.w,
          height: 15.h,
          alignment: Alignment.center,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white70,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}