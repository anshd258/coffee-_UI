import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class PgLowerListCont extends StatefulWidget {
  final e;
  const PgLowerListCont({super.key, required this.e});

  @override
  State<PgLowerListCont> createState() => _PgLowerListContState();
}

class _PgLowerListContState extends State<PgLowerListCont> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //for padding
        SizedBox(
          height: 2.h,
        ),
        // for detecting clicks and directing them to next page-3
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed('/page3', arguments: widget.e),
          child: GlassContainer.clearGlass(
            height: 15.h,
            width: 90.w,
            blur: 15,
            elevation: 10,
            color: Colors.white38,
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                //for padding
                SizedBox(
                  width: 5.w,
                ),
                //main container with discription, rating etc.
                Container(
                  alignment: Alignment.centerLeft,
                  height: 12.h,
                  width: 55.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //name of the product
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
                      //pading
                      SizedBox(
                        height: 0.5.h,
                      ),
                      //inner row
                      Row(
                        children: [
                          //for showing ratings
                          Text(
                            widget.e["rating"],
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              color: Colors.black,
                            ),
                          ),
                          //for padding
                          SizedBox(
                            width: 1.5.w,
                          ),
                          //start icon with yellow color
                          Icon(
                            Icons.star,
                            color: Colors.amber.shade300,
                            size: 13.sp,
                          ),
                          //more padding
                          SizedBox(
                            width: 1.w,
                          ),
                          //no of reviews text
                          Text(
                            widget.e["noreviews"],
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              color: Colors.black,
                            ),
                          ),
                          //for padding
                          SizedBox(
                            width: 5.w,
                          ),
                          // veg symbol
                          Image(image: AssetImage("assets/6.png"))
                        ],
                      ),
                      //padding between inner row and discription
                      SizedBox(
                        height: 0.5.h,
                      ),
                      //discription text
                      Text(
                        widget.e["discription"],
                        style: GoogleFonts.inter(
                            color: Color.fromARGB(205, 255, 255, 255),
                            fontSize: 12.5.sp,
                            textStyle: TextStyle(
                              wordSpacing: 1,
                            )),
                      ),
                    ],
                  ),
                ),
                //for padding
                SizedBox(
                  width: 3.w,
                ),
                //column in the main row with image and the add button
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //padding
                    SizedBox(
                      height: 0.5.h,
                    ),

                    //container with image
                    Container(
                      height: 11.h,
                      width: 24.w,
                      alignment: Alignment.center,
                      child: Image(
                          image: AssetImage(widget.e["image"]),
                          fit: BoxFit.cover),
                    ),
                    //sized box for elevated button
                    Container(
                        height: 2.5.h,
                        width: 15.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 102, 163, 92),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "ADD",
                          style: GoogleFonts.inter(
                              fontSize: 13.sp, color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
