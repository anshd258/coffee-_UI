import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Pg2MidRowCont extends StatefulWidget {
  final e;
  const Pg2MidRowCont({super.key, required this.e});

  @override
  State<Pg2MidRowCont> createState() => _Pg2MidRowContState();
}

class _Pg2MidRowContState extends State<Pg2MidRowCont> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 3.w,
        ),
        //to detect the clicking on the boxes
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/page3", arguments: widget.e);
          },
          child:
              //main boxes in the row to display items
              GlassContainer.clearGlass(
            height: 25.h,
            width: 45.w,
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                //for padding
                SizedBox(
                  height: 2.h,
                ),
                //container with image of the product
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Image(
                      image: AssetImage(widget.e["image"].toString()),
                    ),
                    height: 13.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                //name of the product
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  " + widget.e["name"],
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                ),
                //for padding
                SizedBox(
                  height: 0.6.h,
                ),
                // type of the product TEXT
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "      " + widget.e["type"],
                    style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        fontSize: 8,
                        textStyle: TextStyle(
                          wordSpacing: 1,
                        )),
                  ),
                ),
                //for padding
                SizedBox(
                  height: 0.7.h,
                ),

                Row(
                  children: [
                    //padding
                    SizedBox(
                      width: 5.w,
                    ),
                    //rating of the product
                    Text(
                      widget.e["rating"],
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        color: Colors.black,
                      ),
                    ),
                    //for padding
                    SizedBox(
                      width: 1.5.w,
                    ),
                    //start icon
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade300,
                      size: 16,
                    ),
                    //for padding
                    SizedBox(
                      width: 1.w,
                    ),
                    //number of the reviews of the product
                    Text(
                      widget.e["noreviews"],
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        color: Colors.black,
                      ),
                    ),
                    //for padding
                    SizedBox(
                      width: 10.w,
                    ),
                    // green add icon button
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_box_rounded,
                        color: const Color.fromARGB(255, 102, 163, 92),
                        size: 4.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
      ],
    );
    ;
  }
}
