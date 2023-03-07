import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/models/order_history_model.dart';

import 'order_details_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../../provider/OrderHistoryProvider.dart';

class MerchantHomeScreenRowContainer extends StatefulWidget {
  final String? orderNo;
  final List<String>? items;
  final String? orderId;
  const MerchantHomeScreenRowContainer(
      {super.key,
      required this.orderNo,
      required this.orderId,
      required this.items});

  @override
  State<MerchantHomeScreenRowContainer> createState() => _MerchantHomeScreenRowContainerState();
}

class _MerchantHomeScreenRowContainerState extends State<MerchantHomeScreenRowContainer> {
  OrderHistoryModel? data;
  @override
  void initState() {
    super.initState();
  }

  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    final length = widget.items!.length;
    return GestureDetector(
      onTap: () {
        print(widget.orderId);
        if (isclicked == false) {
          isclicked = true;
          context
              .read<OrderHistory>()
              .getOrderhistory(widget.orderId!)
              .then((value) => orderDetailsDialog(context, value))
              .whenComplete(() => isclicked = false);
        }
      },
      child: GlassContainer.frostedGlass(
        // margin: EdgeInsets.only(right: 6.w),
        height: 28.h,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        width: 43.w,
        borderRadius: BorderRadius.circular(6),
        frostedOpacity: 0.05,
        borderColor: Colors.white30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "",
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 19.w,
                width: 19.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage("assets/3.png"), fit: BoxFit.fill)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.orderNo == null ? "" : widget.orderNo!,
                style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 10.h,
                    width: 40.w,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (length >= 1) ...[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 0.5.w),
                                child: Text(
                                  widget.items![0],
                                  style: GoogleFonts.inter(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                            if (length >= 2) ...[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 0.5.w),
                                child: Text(
                                  widget.items![1],
                                  style: GoogleFonts.inter(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                            if (length >= 3) ...[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 0.5.w),
                                child: Text(
                                  widget.items![2],
                                  style: GoogleFonts.inter(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              if (length >= 4)
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 0.5.w),
                                  child: Text(
                                    "...",
                                    style: GoogleFonts.inter(
                                        color: Colors.white70,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                            ]
                          ]),
                    ),
                  ),
                )),

            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Sugar X1",
            //     style: GoogleFonts.inter(
            //         color: Colors.white70,
            //         fontSize: 13.sp,
            //         fontWeight: FontWeight.w400),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Text(
            //     "Confirm Order",
            //     style: GoogleFonts.inter(
            //         color: Colors.green.shade400,
            //         fontSize: 13.sp,
            //         fontWeight: FontWeight.w700),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
