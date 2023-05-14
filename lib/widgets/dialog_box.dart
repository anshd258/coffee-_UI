import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DialogBox extends StatelessWidget {

  final String start;
  final String end;
  final String message;

  DialogBox({
    Key? key, 
    required this.start,
    required this.end,
    required this.message,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      height: 25.h,
      width: 80.w,
      blur: 14,
      frostedOpacity: 0.04,
      borderRadius: BorderRadius.circular(25),
      color: Colors.black54,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon( Icons.close , color: Colors.white, ),
                ),
                SizedBox( width: 3.w,)
              ],
            ),
            start != "" 
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Cafe Timings
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Cafe Opens at ",
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1),
                          ),
                          Text(start,
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1),
                          )
                        ],
                      ) ,
                      Text("&&",
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1),
                          ) ,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Cafe Closes at ",
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1),
                          ),
                          Text(end,
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1),
                          )
                        ],
                      )
                  ],
                ) : const SizedBox(height: 0, width: 0,),
            Center(
              child: SizedBox(
                width: 70.w,
                child: Center(
                  child: Text(message,
                    style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}