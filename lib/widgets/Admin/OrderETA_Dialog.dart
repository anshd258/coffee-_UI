import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/widgets/Admin/ConfirmationDialog.dart';
import '../../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

Future<void> OrderETA_Dialvog(BuildContext context) async {
  var items = ["5", "10", "15"];
  String Selecte = "5";
  return await showDialog(
    barrierColor: Colors.black87,
    barrierDismissible: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(0),
          child: GlassContainer.frostedGlass(
            color: Colors.white10,
            borderWidth: 0.5,
            frostedOpacity: 0.03,
            height: 27.h,
            width: 80.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            borderRadius: BorderRadius.circular(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "ORDER0001",
                        style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text(
                          "Latte Sugar X 1",
                          style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Estimated Pick Up time",
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 22.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade800,
                                    border: Border.all(
                                        color: Colors.grey.shade600)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    buttonPadding: EdgeInsets.only(left: 2.w),
                                    alignment: Alignment.center,
                                    items: items
                                        .map((e) => DropdownMenuItem<String>(
                                              alignment: Alignment.center,
                                              value: e.toString(),
                                              child: Text(
                                                "$e MIN",
                                                maxLines: 2,
                                                style: GoogleFonts.inter(
                                                    color: const Color.fromARGB(
                                                        255, 197, 197, 197),
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ))
                                        .toList(),
                                    buttonHeight: 3.h,
                                    buttonWidth: 22.w,
                                    iconEnabledColor: Colors.white,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.black54,
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    dropdownMaxHeight: 25.w,
                                    scrollbarAlwaysShow: true,
                                    buttonElevation: 2,
                                    value: Selecte,
                                    offset: const Offset(0, 0),
                                    onChanged: (value) {
                                      setState(() {
                                        Selecte = value as String;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    ConfirmDialog(context, "ARE YOU SURE TO CONFIRM");
                  },
                  child: Text(
                    "Confirm Order",
                    style: GoogleFonts.inter(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(35.w, 3.h),
                      backgroundColor: green,
                      padding: EdgeInsets.all(0),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
