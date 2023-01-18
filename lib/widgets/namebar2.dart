import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class name_bar2 extends StatelessWidget {
  const name_bar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text("👋", style: TextStyle(fontSize: 18.sp)),
            SizedBox(
              width: 3.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "02/01/2023",
                  style: GoogleFonts.inter(
                      color: Color.fromARGB(255, 182, 182, 182),
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Text(
                  "Joshua Scanlan",
                  style: GoogleFonts.inter(
                      color: Color.fromARGB(255, 182, 182, 182),
                      fontSize: 17.sp),
                )
              ],
            ),
          ]),
          Container(
            height: 6.h,
            width: 12.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(width: 0.5, color: Colors.green.shade400),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/user.jpeg",
                    ))),
          ),
        ],
      ),
    );
  }
}
