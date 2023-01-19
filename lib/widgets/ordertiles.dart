import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderPgTiles extends StatelessWidget {
  const OrderPgTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GlassContainer.frostedGlass(
        margin: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
        height: 16.h,
        width: 90.w,
        borderWidth: 0,
        blur: 17,
        frostedOpacity: 0.05,
        color: Color.fromARGB(50, 255, 255, 255),
        borderColor: Colors.white24,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 80.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latte",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 205, 205, 205),
                        ),
                      ),

                      //pading
                      SizedBox(
                        height: 0.8.h,
                      ),
                      //inner row

                      //for showing ratings
                      Row(
                        children: [
                          Text(
                            "FULL",
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              color: Color.fromARGB(255, 205, 205, 205),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "SUGER X 2",
                            style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 197, 197, 197),
                                fontSize: 13.sp,
                                textStyle: TextStyle(
                                  wordSpacing: 1,
                                )),
                          ),
                          SizedBox(width: 10.w)
                        ],
                      ),
                      //for padding
                      SizedBox(
                        height: 01.h,
                      ),
                      Text(
                        "FULL CREAM MILK",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: Color.fromARGB(255, 205, 205, 205),
                        ),
                      ),
                      //for padding
                      SizedBox(
                        width: 5.w,
                      ),
                      // veg symbol

                      //padding between inner row and discription
                      SizedBox(
                        height: 0.5.h,
                      ),
                      //discription text
                    ],
                  ),

                  // SizedBox(width: 30.w),
                  GlassContainer.frostedGlass(
                    color: Colors.white38,
                    height: 8.h,
                    width: 18.w,
                    borderRadius: BorderRadius.circular(10),
                    borderColor: Colors.white12,
                    child: Center(
                      child: Image.asset(
                        "assets/3.png",
                        height: 12.h,
                        width: 23.w,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.8,
              color: Colors.white38,
              indent: 5.w,
              endIndent: 5.w,
            ),
            SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "06 Nov 2022 at 07:27PM",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                    width: 18.w,
                    child: OutlinedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, "/profile");
                      },
                      child: Text(
                        "Order Again",
                        style: GoogleFonts.inter(
                            color: Colors.green.shade400,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.green.shade400),
                          padding: EdgeInsets.all(1)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
