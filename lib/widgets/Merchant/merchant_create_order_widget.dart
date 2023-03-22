import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class merchant_create_order_widget extends StatelessWidget {
  const merchant_create_order_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          context.read<routing>().settingRoute(6);
        },
        child: SizedBox(
          width: 35.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(77, 68, 64, 0.36),
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: (1.h) / 2, horizontal: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 3.h,
                      height: 3.h,
                      child: Image.asset(
                        "assets/coffee_cup.png",
                        fit: BoxFit.fill,
                      )),
                  Text(
                    "Create Orders",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                        color: white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
