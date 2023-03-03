import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SwitchTest extends StatefulWidget {
  final e;
  final String isSelected;
  final Function setter;

  const SwitchTest({super.key, required this.e, required this.setter,  required this.isSelected});

  @override
  State<SwitchTest> createState() => _SwitchTestState();
}

class _SwitchTestState extends State<SwitchTest> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 5.h,
        width: 30.w,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterSwitch(
              activeColor: Colors.green.shade500,
              value: widget.isSelected == widget.e ? true:false,
              onToggle: (val) {
                if (val) {
                  widget.setter(widget.e);
                }

                setState(() {
                  value = val;
                });
              },
              height: 2.5.h,
              toggleSize: 17.sp,
              padding: 2,
              width: 10.w,
            ),
            SizedBox(
              width: 3.w,
            ),
            Container(
              alignment: Alignment.centerLeft,
              // height: 5.h,
              width: 27.w,
              child: Text(
                widget.e,
                maxLines: 2,
                style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 197, 197, 197),
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ));
  }
}
