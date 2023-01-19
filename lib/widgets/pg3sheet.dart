import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:inter_coffee/widgets/pg3togglebutton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './pg3milkswitchgride.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';
import './pg3sugergirde.dart';
import '../models/productmodal.dart';

class Pg3BottomSheet extends StatefulWidget {
  final Products data;
  Pg3BottomSheet({super.key, required this.data});

  @override
  State<Pg3BottomSheet> createState() => _Pg3BottomSheetState();
}

class _Pg3BottomSheetState extends State<Pg3BottomSheet> {
  //dropdown meenue state
  var dropdownvalue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //main glasscontainer
        GlassContainer.frostedGlass(
          height: 140.h,
          width: 100.w,
          blur: 20,
          frostedOpacity: 0.04,
          color: Color.fromARGB(25, 189, 189, 189),
          borderColor: Colors.transparent,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(30), bottom: Radius.zero),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //for padding
              SizedBox(
                height: 3.h,
              ),

              //name rating row

              //for padding

              //name of  the product
              Container(
                width: 90.w,
                margin: EdgeInsets.only(bottom: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data.name!,
                      style: GoogleFonts.inter(
                        fontSize: 22.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 205, 205, 205),
                      ),
                    ),
                    Container(
                      height: 3.h,
                      width: 12.w,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        value: dropdownvalue.toString(),
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, color: Colors.white38),
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        iconEnabledColor:
                            const Color.fromARGB(255, 217, 217, 217),
                        focusColor: Colors.white30,
                        dropdownColor: Colors.black,
                        items: [
                          const DropdownMenuItem(
                            value: '1',
                            child: Text('1'),
                          ),
                          const DropdownMenuItem(
                            value: '2',
                            child: Text('2'),
                          ),
                          const DropdownMenuItem(
                            value: '3',
                            child: Text('3'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            context
                                .read<CartProductsProvider>()
                                .currentproduct
                                .quantity = value ?? "1";
                            dropdownvalue = int.parse(value!);
                          });
                        },
                      ),
                    ),

                    //forpadding

                    //dropdown button
                  ],
                ),
              ),
              Container(
                width: 90.w,
                child: Row(
                  children: [
                    Text(
                      widget.data.ratings!,
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: Color.fromARGB(255, 197, 197, 197),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade300,
                      size: 16.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      widget.data.numberOfReviews!,
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: const Color.fromARGB(255, 197, 197, 197),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image(image: AssetImage("assets/6.png"))
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 90.w,
                child: Text(
                  widget.data.discription!,
                  style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 197, 197, 197),
                      fontSize: 14.5.sp,
                      textStyle: TextStyle(
                        wordSpacing: 1,
                      )),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Choice of Cup Filling",
                    style: GoogleFonts.inter(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                ],
              ),
              //for padding
              SizedBox(
                height: 3.h,
              ),
              // toggle button widget
              Pg3togglebutton(),
              //for padding

              Divider(
                color: Colors.white70,
                endIndent: 5.w,
                indent: 5.w,
                height: 4.h,
              ),
              // choice of milk text
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    " Choice of Milk",
                    style: GoogleFonts.inter(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                ],
              ),
              //milk choosing grid with switches
              Container(
                  height: 20.h,
                  width: 90.w,
                  alignment: Alignment.centerLeft,
                  child: Pg3MilkSwitch()),
              //for padding

              Divider(
                color: Colors.white70,
                endIndent: 5.w,
                indent: 5.w,
                height: 4.h,
              ),
              Row(
                children: [
                  //for padding
                  SizedBox(
                    width: 5.w,
                  ),
                  //choice of sugeer text
                  Text(
                    " Choice of Suger",
                    style: GoogleFonts.inter(
                      fontSize: 19.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                ],
              ),
              //main type of suger selection switch
              Container(
                height: 18.h,
                width: 90.w,
                alignment: Alignment.centerLeft,
                child: Pg3SugerGride(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
