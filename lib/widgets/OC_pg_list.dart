import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cart_stepper/cart_stepper.dart';

class OcpageList extends StatefulWidget {
  final e;
  const OcpageList({super.key, required this.e});

  @override
  State<OcpageList> createState() => _OcpageListState();
}

class _OcpageListState extends State<OcpageList> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //for padding
        SizedBox(
          height: 2.h,
        ),
        // for detecting clicks and directing them to next page-3
        GestureDetector(
          // onTap: () =>
          //     Navigator.of(context).pushNamed('/page3', arguments: widget.e),
          child: GlassContainer.frostedGlass(
            height: 15.h,
            width: 93.w,
            borderWidth: 0,
            blur: 17,
            frostedOpacity: 0.04,
            color: Color.fromARGB(40, 255, 255, 255),
            borderColor: Colors.white24,
            borderRadius: BorderRadius.circular(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //for padding

                Center(
                  child: GlassContainer.frostedGlass(
                    height: 12.h,
                    width: 25.w,
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    padding: EdgeInsets.only(top: 1.h, left: 1.h),
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage(
                        widget.e["image"],
                      ),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),

                //main container with discription, rating etc.
                Container(
                  alignment: Alignment.centerLeft,
                  height: 13.h,
                  width: 57.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name of the product
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.e["name"],
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                          ),
                          CartStepperInt(
                            value: counter,
                            size: 2.3.h,
                            numberSize: 0.8.w,
                            elevation: 0,
                            style: CartStepperStyle(
                                activeBackgroundColor: Colors.transparent),
                            didChangeCount: (value) {
                              if (value <= 5)
                                setState(() {
                                  counter = value;
                                });
                            },
                          )
                        ],
                      ),

                      //pading
                      SizedBox(
                        height: 0.8.h,
                      ),
                      //inner row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //for showing ratings
                          Row(
                            children: [
                              Text(
                                "FULL",
                                style: GoogleFonts.inter(
                                    fontSize: 12.5.sp,
                                    color: Color.fromARGB(255, 205, 205, 205),
                                    fontWeight: FontWeight.w600),
                              ),
                              //for padding
                              SizedBox(
                                width: 1.w,
                              ),
                              //start icon with yellow color

                              //more padding
                              SizedBox(
                                width: 1.w,
                              ),
                              //no of reviews text
                              Text(
                                "FULL CREAM MILK",
                                style: GoogleFonts.inter(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 205, 205, 205),
                                ),
                              ),
                            ],
                          ),

                          //for padding

                          // veg symbol
                        ],
                      ),
                      //padding between inner row and discription
                      SizedBox(
                        height: 0.5.h,
                      ),
                      //discription text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SUGER X 2",
                            style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 197, 197, 197),
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(
                                  wordSpacing: 1,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      Divider(
                        height: .5.h,
                        thickness: 1,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        height: 3.h,
                        width: 52.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Instructions for Cafe",
                                style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 197, 197, 197)),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size(28.w, 2.h),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Add More Items",
                                style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 197, 197, 197)),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size(23.w, 2.h),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //for padding

                //column in the main row with image and the add button
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     //padding
                //     SizedBox(
                //       height: 0.5.h,
                //     ),

                //     //container with image
                //     Container(
                //       height: 11.h,
                //       width: 24.w,
                //       alignment: Alignment.center,
                //       child: Image(image: AssetImage(widget.e["image"])),
                //     ),
                //     //sized box for elevated button
                //     SizedBox(
                //       height: 2.5.h,
                //       width: 15.w,
                //       child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //               elevation: 3,
                //               backgroundColor:
                //                   Color.fromARGB(255, 102, 163, 92)),
                //           onPressed: () {},
                //           child: Text(
                //             "ADD",
                //             style: GoogleFonts.inter(fontSize: 9),
                //           )),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
