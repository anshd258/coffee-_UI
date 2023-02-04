import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChoiceSwitch extends StatefulWidget {
  final List list;
  const ChoiceSwitch({
    super.key,
    required this.list
  });

  @override
  State<ChoiceSwitch> createState() => _ChoiceSwitchState();
}
String isSelected = "";
class _ChoiceSwitchState extends State<ChoiceSwitch> {
  
  @override
  Widget build(BuildContext context) {
    isSelected = widget.list[0];
    print("working");
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 5.w / 0.7.h,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: widget.list.map((e) {
          print(e.toString());
          final _ctr = ValueNotifier<bool>(false);
          @override
          void initState() {
            super.initState();
            _ctr.addListener(() {
              setState(() {
                isSelected == e 
                  ? _ctr.value = true : _ctr.value = false;
                print(e);
              
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = e;
                      });
                    },
                    child: AdvancedSwitch(
                      width: 8.w,
                      height: 2.h,
                      controller: _ctr,
                      enabled: true,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    // height: 5.h,
                    width: 30.w,
                    child: Text(
                      e,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 197, 197, 197),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ));
        }).toList());
  }
}
