import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChoiceSwitch extends StatefulWidget {
  final List list;
  final String heading;
  const ChoiceSwitch({super.key, required this.list, required this.heading});

  @override
  State<ChoiceSwitch> createState() => _ChoiceSwitchState();
}

String isSelected = "";

class _ChoiceSwitchState extends State<ChoiceSwitch> {
  @override
  Widget build(BuildContext context) {
    isSelected = widget.list[0];
    void cartAssigner(String text, String value) {
      switch (text) {
        case "choiceOfCupFilling":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfCupFilling(value);
          break;

        case "choiceOfMilk":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfMilk(value);
          break;

        case "choiceOfSugar":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfSugar(value);
          break;

        case "choiceOfSyrup":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfSyrup(value);
          break;

        case "eta":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateETA(value);
          break;
      }
    }
    print("working");
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 5.w / 0.7.h,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: widget.list.map((e) {
          print(e.toString());
          final ctr = ValueNotifier<bool>(false);
          @override
          void initState() {
            super.initState();
            ctr.addListener(() {
              setState(() {
                isSelected == e ? ctr.value = true : ctr.value = false;
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
                        cartAssigner(widget.heading, e);
                        print("this is choice of Milk -> ${context
                  .read<CartProductsProvider>()
                  .currentproduct
                  .choiceOfMilk}");
                      });
                    },
                    child: AdvancedSwitch(
                      width: 8.w,
                      height: 2.h,
                      controller: ctr,
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
