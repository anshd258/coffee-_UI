import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminOrderCountContainer extends StatelessWidget {
  const AdminOrderCountContainer(
      {super.key,
      required this.title,
      required this.quantity,
      required this.onTap});

  final String title;
  final int? quantity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer.frostedGlass(
        margin: EdgeInsets.all(3.w),
        height: 16.h,
        padding: EdgeInsets.all(3.w),
        width: 43.w,
        borderRadius: BorderRadius.circular(15),
        frostedOpacity: 0.05,
        borderColor: Colors.white30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: quantity == null
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      quantity.toString(),
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(255, 255, 255, 0.702),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700),
                    ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "View All",
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
