import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> OrderDetailsDialog(BuildContext context) async {
  return await showDialog(
    barrierColor: Colors.black87,
    barrierDismissible: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          child: GlassContainer.frostedGlass(
            color: Colors.white10,
            borderWidth: 0.5,
            frostedOpacity: 0.03,
            height: 40.h,
            borderColor: Colors.white24,
            width: 80.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
            borderRadius: BorderRadius.circular(15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Order Details",
                      style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.5.h, top: 2.5.h),
                    width: 50.w,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order No :",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Order00001",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1.5.h),
                    width: 60.w,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ordered By :",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 4.h,
                            width: 30.w,
                            child: Text(
                              "Manisha Gupta (TM-001)",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1.5.h),
                    width: 55.w,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order :",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1 Latte",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Full",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Full Cream Milk",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Sugar X 1",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1.5.h),
                    width: 43.w,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ETA :",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "15 mins",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
