import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Future<DateTime?> dateTimeSetterTo(
    BuildContext context, Function toDateSetter) {
  return DatePicker.showDatePicker(
    context,
    onConfirm: ((time) {
      toDateSetter(time, context);
    }),
    currentTime: DateTime.now(),
    theme: DatePickerTheme(
      backgroundColor: const Color.fromARGB(30, 0, 0, 0),
      cancelStyle: GoogleFonts.inter(
          color: Colors.redAccent.shade400,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500),
      doneStyle: GoogleFonts.inter(
          color: Colors.greenAccent.shade700,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500),
      itemStyle: GoogleFonts.inter(
          color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500),
    ),
  );
}
