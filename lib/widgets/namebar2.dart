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
      width: size.width - 30,
      height: size.height - 730,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("👋", style: TextStyle(fontSize: 19)),
          SizedBox(
            width: size.width - 340,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "02/01/2023",
                style: GoogleFonts.inter(
                    color: Color.fromARGB(255, 182, 182, 182), fontSize: 10),
              ),
              Text(
                "Joshua Scanlan",
                style: GoogleFonts.inter(
                    color: Color.fromARGB(255, 182, 182, 182), fontSize: 15),
              )
            ],
          ),
          SizedBox(
            width: size.width - 300,
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
                )),
          ),
          SizedBox(
            width: 3.w,
          ),
          Container(
            height: 10.h,
            width: 10.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                    image: AssetImage(
                  "assets/5.png",
                ))),
          )
        ],
      ),
    );
  }
}
