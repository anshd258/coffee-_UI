import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Pg3highPrioButton extends StatefulWidget {
  const Pg3highPrioButton({super.key});

  @override
  State<Pg3highPrioButton> createState() => _Pg3highPrioButtonState();
}

class _Pg3highPrioButtonState extends State<Pg3highPrioButton> {
  bool checknox = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //checkbox for selection of high priority
        Checkbox(
            checkColor: Colors.white,
            side: BorderSide(color: Colors.white),
            activeColor: Colors.greenAccent.shade700,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            value: checknox,
            onChanged: (onChanged) {
              setState(() {
                checknox = onChanged!;
              });
            }),
        //text of high prioriity
        Text(
          "High Priority",
          style: GoogleFonts.inter(
            color: const Color.fromRGBO(205, 205, 205, 1),
            fontSize: 14,
          ),
        ),
        //for padding
        SizedBox(
          width: 2.w,
        ),
        //for padding
        Image.asset("assets/8.png"), //image ofurgent symbol
        //for padding
        SizedBox(
          width: 8.w,
        ),
        //submit elevated button
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Submit",
            style: GoogleFonts.inter(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(28.w, 4.h),
              backgroundColor: Colors.greenAccent.shade700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
        )
      ],
    );
  }
}
