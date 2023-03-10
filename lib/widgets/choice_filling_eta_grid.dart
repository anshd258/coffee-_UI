import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChoiceFillingETAGrid extends StatefulWidget {
  const ChoiceFillingETAGrid({super.key});

  @override
  State<ChoiceFillingETAGrid> createState() => _ChoiceFillingETAGridState();
}

class _ChoiceFillingETAGridState extends State<ChoiceFillingETAGrid> {
  final ETA = ["5 Mins", "10 Mins", "15 mins"];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.5 / 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 2.h),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: ETA.map((e) {
          final ctr = ValueNotifier<bool>(false);
          @override
          void initState() {
            super.initState();
            ctr.addListener(() {
              setState(() {});
            });
          }

          return Container(
              height: 5.h,
              width: 30.w,
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AdvancedSwitch(
                    width: 8.w,
                    height: 2.h,
                    controller: ctr,
                    enabled: true,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 5.h,
                    width: 30.w,
                    child: Text(
                      e,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 197, 197, 197),
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ));
        }).toList());
  }
}
