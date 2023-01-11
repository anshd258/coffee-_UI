import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Pg3SugerGride extends StatefulWidget {
  const Pg3SugerGride({super.key});

  @override
  State<Pg3SugerGride> createState() => _Pg3SugerGrideState();
}

class _Pg3SugerGrideState extends State<Pg3SugerGride> {
  List suger = [
    "Sugar X1",
    "Sugar X2",
    "½ Sugar",
    "No Sugar",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.5 / 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 2.h),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: suger.map((e) {
          final _ctr = ValueNotifier<bool>(false);
          @override
          void initState() {
            super.initState();
            _ctr.addListener(() {
              setState(() {});
            });
          }

          return Container(
              height: 3.h,
              width: 30.w,
              child: Row(
                children: [
                  AdvancedSwitch(
                    width: 6.w,
                    height: 2.h,
                    controller: _ctr,
                    enabled: true,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    e,
                    style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ));
        }).toList());
  }
}
