import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class Pg3togglebutton extends StatefulWidget {
  Pg3togglebutton({super.key});

  @override
  State<Pg3togglebutton> createState() => _Pg3togglebuttonState();
}

class _Pg3togglebuttonState extends State<Pg3togglebutton> {
  //toggle button state
  bool first = false;
  bool two = false;
  bool three = false;
  bool four = false;
  //toggle button contoller for state
  int v = 1;
  @override
  Widget build(BuildContext context) {
    /// swwitch case for shiftting the toggle button and turning off other when any one of the Switch is slected
    switch (v) {
      case 1:
        {
          first = true;
          two = false;
          three = false;
          four = false;
        }
        break;
      case 2:
        {
          first = false;
          two = true;
          three = false;
          four = false;
        }
        break;
      case 3:
        {
          first = false;
          two = false;
          three = true;
          four = false;
        }
        break;
      case 4:
        {
          first = false;
          two = false;
          three = false;
          four = true;
        }
        break;
    }

    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        SizedBox(
          height: 3.h,
          width: 15.w,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                context.read<CartProductsProvider>().currentproduct.choiceOfCupFilling = "FULL";
                v = 1;
              });
            },
            child: Text(
              "FULL",
              style: GoogleFonts.inter(
                  color: first ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor:
                    first ? Colors.greenAccent.shade700 : Colors.white),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        SizedBox(
          height: 3.h,
          width: 17.w,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                context.read<CartProductsProvider>().currentproduct.choiceOfCupFilling  = "1/2FULL";
                v = 2;
              });
            },
            child: Text(
              "1/2 FULL",
              style: GoogleFonts.inter(
                  color: two ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor:
                    two ? Colors.greenAccent.shade700 : Colors.white),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        SizedBox(
          height: 3.h,
          width: 17.w,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
               context.read<CartProductsProvider>().currentproduct.choiceOfCupFilling  = "3/4FULL";
                v = 3;
              });
            },
            child: Text(
              "3/4 FULL",
              style: GoogleFonts.inter(
                  color: three ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor:
                    three ? Colors.greenAccent.shade700 : Colors.white),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        SizedBox(
          height: 3.h,
          width: 17.w,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
               context.read<CartProductsProvider>().currentproduct.choiceOfCupFilling  = "1/4 FULL";
                v = 4;
              });
            },
            child: Text(
              "1/4 FULL",
              style: GoogleFonts.inter(
                  color: four ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor:
                    four ? Colors.greenAccent.shade700 : Colors.white),
          ),
        ),
      ],
    );
  }
}
