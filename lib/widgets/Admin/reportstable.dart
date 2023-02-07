import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:json_table/json_table.dart';
import '../../constants/colors.dart';

class ReportsTable extends StatelessWidget {
  final List<Map<String, dynamic>> json5 = [
    {"Name": "Raman", "Item Name": "latte", "Number Of Deliveries": "25"},
    {"Name": "Raman", "Item Name": "latte", "Number Of Deliveries": "25"},
    {"Name": "Raman", "Item Name": "latte", "Number Of Deliveries": "25"}
  ];
  ReportsTable({super.key});
  String headerVal = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: JsonTable(json5, tableHeaderBuilder: (header) {
        headerVal = header.toString();
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: tableBlack,
            border: Border.all(color: borderWhite),
          ),
          child: Center(
            child: Text(
              header.toString(),
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  color: white, fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          ),
        );
      }, tableCellBuilder: (value) {
        return Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: tableBlack,
            border: Border.all(color: borderWhite),
          ),
          child: Center(
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  color: white, fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          ),
        );
      }),
    );
  }
}
