import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/widgets/order_confirmation_dialog.dart';
import '../../provider/merchantProvider/table_priority_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/table_with_status_provider.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

Future<void> orderETADialog(
    BuildContext context, String id, String type) async {
  print(id);
  var items = ["5", "10", "15", "20", "30"];
  String selecteditem = "5";
  return await showDialog(
    barrierColor: Colors.black87,
    barrierDismissible: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          child: GlassContainer.frostedGlass(
            color: Colors.white10,
            borderWidth: 0.5,
            frostedOpacity: 0.03,
            height: 27.h,
            borderColor: Colors.white24,
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
                                    value: selecteditem,
                                    offset: const Offset(0, 0),
                                    onChanged: (value) {
                                      setState(() {
                                        selecteditem = value as String;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (type == "priority") {
                          context
                              .read<TablePriorityProvider>()
                              .updateOrderStatus(selecteditem, id);
                          orderConfirmationDialog(
                              context, "Order Confirmed !", 5);
                        } else {
                          context
                              .read<TableWithStatusProvider>()
                              .updateOrderStatus(selecteditem, id);
                          orderConfirmationDialog(
                              context, "Order Confirmed !", 3);
                        }

                        // Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(35.w, 3.h),
                          backgroundColor: green,
                          padding: const EdgeInsets.all(0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      child: Text(
                        "Confirm Order",
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (type == "priority") {
                          context
                              .read<TablePriorityProvider>()
                              .updateOrderStatusWithoutTime(
                                  "ORDER_CANCELLED", id, "ORDER_PLACED");
                        } else {
                          context
                              .read<TableWithStatusProvider>()
                              .updateOrderStatusWithoutTime(
                                  "ORDER_CANCELLED", id, "ORDER_PLACED");
                        }
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(30.w, 3.h),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      child: Text(
                        "Cancel Order",
                        style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
