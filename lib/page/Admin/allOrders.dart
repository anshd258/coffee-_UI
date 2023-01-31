import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widgets/Admin/AdminHomeRowContainer.dart';

class AllOrders extends StatelessWidget {
  AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ];
    final title = ModalRoute.of(context)!.settings.arguments;

    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.all(0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/AdminBG.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.frostedGlass(
        height: 100.h,
        width: 100.w,
        blur: 17,
        padding: EdgeInsets.all(0),
        frostedOpacity: 0.05,
        borderWidth: 0,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 0.43),
              Color.fromRGBO(0, 0, 0, 0.85)
            ]),
        borderColor: Colors.transparent,
        child: Scaffold(
            backgroundColor: Colors.black38,
            appBar: AppBar(
              titleSpacing: 0,
              leadingWidth: 14.w,
              title: Text(title.toString(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600)),
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
              ),
              backgroundColor: Colors.white12,
            ),
            body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 2.h),
                padding: EdgeInsets.only(top: 2.h),
                itemCount: items.length,
                itemBuilder: (context, index) => AdminHomeRowContainer(
                    coffeeName: "coffeeName",
                    coffeeDetails: "coffeeDetails",
                    onTap: () {}))),
      ),
    );
  }
}