import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminHomeRowContainer extends StatelessWidget {
  const AdminHomeRowContainer(
      {super.key,
      required this.coffeeName,
      required this.coffeeDetails,
      required this.onTap});

  final String coffeeName;
  final String coffeeDetails;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer.frostedGlass(
        margin: EdgeInsets.only(right: 6.w),
        height: 25.h,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        width: 43.w,
        borderRadius: BorderRadius.circular(6),
        frostedOpacity: 0.05,
        borderColor: Colors.white30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "15 Mins",
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 19.w,
                width: 19.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage("assets/3.png"), fit: BoxFit.fill)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                coffeeName,
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Text(
                  coffeeDetails,
                  style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Sugar X1",
            //     style: GoogleFonts.inter(
            //         color: Colors.white70,
            //         fontSize: 13.sp,
            //         fontWeight: FontWeight.w400),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Confirm Order",
                style: GoogleFonts.inter(
                    color: Colors.green.shade400,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
