import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/colors.dart';

Future<void> ConfirmDialog(BuildContext context, String title) async {
  return await showDialog(
    barrierColor: Colors.black87,
    barrierDismissible: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(0),
            child: GlassContainer.frostedGlass(
              height: 15.h,
              width: 65.w,
              borderWidth: 0.5,
              frostedOpacity: 0.03,
              color: Colors.white10,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              borderRadius: BorderRadius.circular(15),
              borderColor: Colors.white24,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 4.h,
                      width: 50.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "OK",
                              style: GoogleFonts.inter(
                                  color: green,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                fixedSize: Size(3.h, 15.w),
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                          SizedBox(
                            height: 4.h,
                            width: 25.w,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "CANCLE",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade300,
                                  minimumSize: Size(4.h, 25.w),
                                  padding: EdgeInsets.all(1.w),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ));
      },
    ),
  );
}