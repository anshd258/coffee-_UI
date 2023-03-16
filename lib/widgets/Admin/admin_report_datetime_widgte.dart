import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DateDisplayAdminReports extends StatelessWidget {
  const DateDisplayAdminReports({
    super.key,
    required this.fromdate,
  });

  final String fromdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      width: 30.w,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            fromdate,
            textAlign: TextAlign.start,
            style: GoogleFonts.inter(
                color: Colors.grey.shade600,
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.grey.shade600,
            size: 19.sp,
          )
        ],
      ),
    );
  }
}
