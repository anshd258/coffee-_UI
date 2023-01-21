import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminOrderCountContainer extends StatelessWidget {
  const AdminOrderCountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      margin: EdgeInsets.all(3.w),
      height: 13.h,
      padding: EdgeInsets.all(3.w),
      width: 43.w,
      borderRadius: BorderRadius.circular(15),
      frostedOpacity: 0.05,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Priority Orders",
              style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "4",
              style: GoogleFonts.inter(
                  color: Color.fromRGBO(255, 255, 255, 0.702),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "View All",
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
