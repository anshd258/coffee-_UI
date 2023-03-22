import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<DateTime?> dateTimeMethod(
    BuildContext context, Function fromDateSetter) {
  return DatePicker.showDatePicker(
    context,
    onConfirm: ((time) {
      fromDateSetter(time);
    }),
    currentTime: DateTime.now(),
    theme: DatePickerTheme(
      backgroundColor: Colors.transparent,
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
