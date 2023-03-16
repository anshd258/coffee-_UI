import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/order_prouct.dart';

class ToggleButton extends StatefulWidget {
  final List<String> list;
  final String heading;

  const ToggleButton({super.key, required this.list, required this.heading});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  //toggle button state
  String isSelected = "";
  Choice tempChoice = Choice();
  @override
  void initState() {
    tempChoice.name = widget.heading;
    tempChoice.type = "List";
    super.initState();
  }

  void setter(data) {
    context.read<CartProductsProvider>().currentChoie.remove(tempChoice);
    tempChoice.choice = [];
    tempChoice.choice!.add(data);
    context.read<CartProductsProvider>().choiceSetter(tempChoice);
  }

  @override
  Widget build(BuildContext context) {
    print(context.watch<CartProductsProvider>().cartData);
    List<String> mainList = widget.list;

    Color bgColor = Colors.white;
    Color txtColor = Colors.black87;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: mainList.map((e) {
        return GestureDetector(
          onDoubleTap: () {
            setState(() {
              isSelected = "";
            });
          },
          onTap: () {
            setter(e);

            setState(() {
              isSelected = e;
            });
          },
          child: Container(
            height: 4.h,
            padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.25.h),
            margin: EdgeInsets.only(right: 2.5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:
                  isSelected == e ? Colors.greenAccent.shade700 : Colors.white,
            ),
            child: Center(
              child: Text(
                e,
                style: GoogleFonts.inter(
                    color: isSelected == e ? Colors.white : Colors.black87,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      }).toList()),
    );
  }
}
