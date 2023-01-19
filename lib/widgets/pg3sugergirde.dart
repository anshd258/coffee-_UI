import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';


class Pg3SugerGride extends StatefulWidget {
  Pg3SugerGride({super.key});

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
              setState(() {
                context
                    .read<CartProductsProvider>()
                    .currentproduct
                    .choiceOfSuger =  _ctr.value?e.toString():"";
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
