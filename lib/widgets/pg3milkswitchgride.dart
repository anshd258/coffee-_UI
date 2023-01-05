import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Pg3MilkSwitch extends StatefulWidget {
  const Pg3MilkSwitch({super.key});

  @override
  State<Pg3MilkSwitch> createState() => _Pg3MilkSwitchState();
}

class _Pg3MilkSwitchState extends State<Pg3MilkSwitch> {
  List values = [
    "Sikkim milk",
    "Full Cream Milk",
    "Almond Milk",
    "Oat Milk",
    "Soy Milk",
    "Lactose Free Milk"
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 4.w / 0.6.h,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 2.h),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: values.map((e) {
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
