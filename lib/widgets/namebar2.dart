import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class name_bar2 extends StatelessWidget {
  const name_bar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 7.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 03.w,
          ),
          Text("👋", style: TextStyle(fontSize: 6.w)),
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "02/01/2023",
                style: GoogleFonts.inter(
                    color: Color.fromARGB(255, 182, 182, 182), fontSize: 3.w),
              ),
              Text(
                "Joshua Scanlan",
                style: GoogleFonts.inter(
                    color: Color.fromARGB(255, 182, 182, 182), fontSize: 5.w),
              )
            ],
          ),
          SizedBox(
            width: 19.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          Container(
            height: 7.h,
            width: 12.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/5.png",
                    ))),
          )
        ],
      ),
    );
  }
}
