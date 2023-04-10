import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/reports_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:json_table/json_table.dart';
import '../../constants/colors.dart';

class ReportsTable extends StatelessWidget {
  List<dynamic> json5 = [
    {},
  ];
  ReportsTable({super.key});
  String headerVal = "";
  @override
  Widget build(BuildContext context) {
    final data = context.watch<ReportsProvider>().reportsData;

    if (data.isNotEmpty) {
      json5 = data;
    }
    return Center(
      child: JsonTable(json5, columns: [
        JsonTableColumn('employee', defaultValue: null, label: "Name"),
        JsonTableColumn('product', defaultValue: null, label: "Product"),
        JsonTableColumn('quantity', defaultValue: null, label: "Quantity"),
      ], tableHeaderBuilder: (header) {
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
