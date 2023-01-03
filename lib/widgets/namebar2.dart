import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class name_bar2 extends StatelessWidget {
  const name_bar2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
          Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.center,
                height: 3.5.h,
                width: 7.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 182, 182, 182)),
                child: Icon(
                  Icons.delete_outline,
                  size: 3.h,
                )),
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
