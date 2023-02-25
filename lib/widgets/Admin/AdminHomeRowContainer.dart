import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/models/order_history_model.dart';

import './OrderDetailsDialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../../provider/OrderHistoryProvider.dart';

class AdminHomeRowContainer extends StatefulWidget {
  final String? orderId;

  final VoidCallback onTap;
  AdminHomeRowContainer(
      {super.key, required this.orderId, required this.onTap});

  @override
  State<AdminHomeRowContainer> createState() => _AdminHomeRowContainerState();
}

class _AdminHomeRowContainerState extends State<AdminHomeRowContainer> {
  OrderHistoryModel? data;
  @override
  void initState() {
    dataGetter();

    super.initState();
  }

  void dataGetter() async {
    // context.read<OrderHistory>().getOrderhistory(widget.orderId!).then((value) {
    //   data = value;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: GlassContainer.frostedGlass(
        // margin: EdgeInsets.only(right: 6.w),
        height: 28.h,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
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
                "15 Mins",
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
              child: widget.orderId == null
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      widget.orderId!.substring(
                          widget.orderId!.length - 10, widget.orderId!.length),
                      style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600),
                    ),
            ),
            GestureDetector(
              onTap: () {},
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 6.h,
                    width: 40.w,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: data == null
                              ? [const CircularProgressIndicator.adaptive()]
                              : data!.items!.map((e) {
                                  return Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 0.5.w),
                                    child: Text(
                                      "${e.productName} x ${e.quantity.toString()}",
                                      style: GoogleFonts.inter(
                                          color: Colors.white70,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }).toList()),
                    ),
                  )),
            ),
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
