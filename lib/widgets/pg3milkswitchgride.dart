import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Pg3MilkSwitch extends StatefulWidget {
  Pg3MilkSwitch({
    super.key,
  });

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
    print("working");
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 5.w / 0.6.h,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: values.map((e) {
          print(e.toString());
          final _ctr = ValueNotifier<bool>(false);
          @override
          void initState() {
            super.initState();
            _ctr.addListener(() {
              setState(() {
                print(e);
                context
                    .read<CartProductsProvider>()
                    .currentproduct
                    .choiceOfMilk = _ctr.value?e.toString():"";
              });
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
                    controller: _ctr,
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
