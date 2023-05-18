import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/Merchant/cafe_timings_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectDayTime extends StatefulWidget {
  final String day;
  const SelectDayTime({
    super.key,
    required this.day
  });

  @override
  State<SelectDayTime> createState() => _SelectDayTimeState();
}

class _SelectDayTimeState extends State<SelectDayTime> {

  String startTime = "00:00";
  String endTime = "00:00";

  @override
  Widget build(BuildContext context) {

    String timeToString( String time ) {
      int hr = int.parse( time.substring(0,2) );
      if( hr > 12 ) {
        hr = hr - 12;
        time = "${hr.toString()}${time.substring(2)}PM";
      } else {
        time = "${hr.toString()}${time.substring(2)}AM";
      }
      
      return time;
    }
    
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 4.5.h,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.day,
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
          height: 4.5.h,
          child: Center(
            child: GestureDetector(
              onTap: () {
                BottomPicker.time(
                  title: "Select Time",
                  titleStyle: const  TextStyle(
                    fontWeight:  FontWeight.bold,
                    fontSize:  15,
                    color:  Colors.black
                  ),
                  onSubmit: (index) {
                    setState(() {
                      startTime = index.toString().substring(11,16);
                      startTime = timeToString( startTime );
                      String day = widget.day.toUpperCase();
                      setTimings.forEach((key, value) {
                        if( key == 'cafeTimings' ) {
                          if( value is List ) {
                            for( var e in value ) {
                              if( e['day'] == day ) {
                                e['openTime'] = startTime;
                              }
                            }
                          }
                        }
                      });
                    });
                    print(startTime);
                  },
                  onClose: () {
                    print("Picker closed");
                  },
                  use24hFormat:  false
                ).show(context);
              },
              child: Container(
                width: 20.w,
                height: 3.5.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.5.w)
                ),
                child: Center(
                  child: Text(
                    startTime,
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ),
        ),
        SizedBox(
          width: 24.w,
          height: 4.5.h,
          child: Center(
            child: GestureDetector(
              onTap: () {
                BottomPicker.time(
                  title: "Select Time",
                  titleStyle: const  TextStyle(
                    fontWeight:  FontWeight.bold,
                    fontSize:  15,
                    color:  Colors.black
                  ),
                  onSubmit: (index) {
                    setState(() {
                      endTime = index.toString().substring(11,16);
                      endTime = timeToString( endTime );
                      String day = widget.day.toUpperCase();
                      setTimings.forEach((key, value) {
                        if( key == 'cafeTimings' ) {
                          if( value is List ) {
                            for( var e in value ) {
                              if( e['day'] == day ) {
                                e['closeTime'] = endTime;
                              }
                            }
                          }
                        }
                      });
                    });
                    print(endTime);
                  },
                  onClose: () {
                    print("Picker closed");
                  },
                  use24hFormat:  false
                ).show(context);
              },
              child: Container(
                width: 20.w,
                height: 3.5.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.5.w)
                ),
                child: Center(
                  child: Text(
                    endTime,
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ),
        ),
      ],
    );
  }
}