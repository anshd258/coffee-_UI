import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/Merchant/time_selection_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CafeTimingsInput extends StatelessWidget {
  final TextEditingController _messageTextController = TextEditingController();
  CafeTimingsInput({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GlassContainer.frostedGlass(
      height: 65.h,
      width: 90.w,
      borderWidth: 1,
      blur: 17,
      frostedOpacity: 0.04,
      color: const Color.fromARGB(60, 255, 255, 255),
      borderColor: Colors.white24,
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox( height: 2.h, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Swift Cafe Timings",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                Image.asset("assets/ICONS/calender.png")
              ],
            ),
            SizedBox( height: 2.h, ),
            Padding(
              padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        child: Text(
                          "Weekdays",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                        child: Center(
                          child: Text(
                            "Open",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                        child: Center(
                          child: Text(
                            "Close",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox( height: 2.h,),
                  // Monday
                  const SelectDayTime( day: "Monday" ),

                  // Tuesday
                  const SelectDayTime( day: "Tuesday" ),

                  // Wednesday
                  const SelectDayTime( day: "Wednesday" ),

                  // Thursday 
                  const SelectDayTime( day: "Thursday" ),

                  // Friday 
                  const SelectDayTime( day: "Friday" ),

                  // Saturday
                  const SelectDayTime( day: "Saturday" ),         

                  // Sunday
                  const SelectDayTime( day: "Sunday" ),     

                  // Message
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 9.h,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Message",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 44.w,
                        height: 12.h,
                        margin: EdgeInsets.only(left: 2.w),
                        child: TextField(
                          controller: _messageTextController,
                          minLines: 2,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
                      ),
                    ],
                  ),

                  //Submit button
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only( right: 5.w, top: 0 ),
                    child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(25.w, 5.h),
                              elevation: 5,
                              backgroundColor: Colors.greenAccent.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7))),
                          child: Text(
                            "Submit",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}