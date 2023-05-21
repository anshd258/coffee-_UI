import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:inter_coffee/widgets/Merchant/cafe_timings_input.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CafeTimingSetScreen extends StatefulWidget {
  const CafeTimingSetScreen({super.key});

  @override
  State<CafeTimingSetScreen> createState() => _CafeTimingSetScreenState();
}

class _CafeTimingSetScreenState extends State<CafeTimingSetScreen> {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<userDetailsProvider>().currentUserDetails;
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bg1.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.frostedGlass(
        height: 100.h,
        width: 100.w,
        borderWidth: 0,
        blur: 17,
        frostedOpacity: 0.03,
        color: const Color.fromARGB(15, 255, 255, 255),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("My Account",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600)),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            backgroundColor: Colors.white12,
          ),
          body: Padding(
            padding: EdgeInsets.only( left: 5.w ),
            child: CafeTimingsInput(),
          ),
        ),
      ),
    );
  }
}