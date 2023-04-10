import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/order_confirmation_dialog.dart';
import '../../provider/merchantProvider/table_priority_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/table_with_status_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/colors.dart';

Future<void> confirmationDialog(BuildContext context, String title,
    String nextState, String id, String previousState, String type) async {
  return await showDialog(
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.75),
    barrierDismissible: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0),
            child: GlassContainer.frostedGlass(
              height: 15.h,
              width: 65.w,
              borderWidth: 0.5,
              frostedOpacity: 0.03,
              color: Colors.white10,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              borderRadius: BorderRadius.circular(15),
              borderColor: Colors.white24,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4.h,
                      width: 50.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (type == "priority") {
                                context
                                    .read<TablePriorityProvider>()
                                    .updateOrderStatusWithoutTime(
                                        nextState, id, previousState);
                                orderConfirmationDialog(context, nextState.replaceAll("_", " "),5 );
                              } else {
                                context
                                  .read<TableWithStatusProvider>()
                                  .updateOrderStatusWithoutTime(
                                      nextState, id, previousState);
                                orderConfirmationDialog(context, nextState.replaceAll("_", " "), 3);
                              }
                              
                              // Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                fixedSize: Size(3.h, 15.w),
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: Text(
                              "OK",
                              style: GoogleFonts.inter(
                                  color: green,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                            width: 25.w,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade300,
                                  minimumSize: Size(4.h, 25.w),
                                  padding: EdgeInsets.all(1.w),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Text(
                                "CANCEL",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ));
      },
    ),
  );
}
