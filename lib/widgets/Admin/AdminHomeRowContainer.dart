import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import './OrderDetailsDialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminHomeRowContainer extends StatelessWidget {
  const AdminHomeRowContainer(
      {super.key,
      required this.orderId,
      required this.products,
      required this.onTap});

  final String orderId;
  final List products;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer.frostedGlass(
        // margin: EdgeInsets.only(right: 6.w),
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
                orderId,
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: () => OrderDetailsDialog(context),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 6.h,
                    width: 40.w,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: products.map((e) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 0.5.w),
                              child: Text(
                                "${e["name"]} x ${e["quantity"].toString()}",
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            );
                          }).toList()),
                    ),
                  )),
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
