import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/models/order_history_model.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/merchantProvider/set_cafe_timings.dart';
import 'package:inter_coffee/provider/order_history_provider.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:inter_coffee/provider/order_stauts_provider.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:inter_coffee/widgets/Admin/order_details_dialog.dart';
import 'package:inter_coffee/widgets/order_completed_dialog.dart';
import 'package:inter_coffee/widgets/order_confirmation_dialog.dart';
import 'package:inter_coffee/widgets/snackbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';
import '../provider/login_auth_provider.dart';
import 'package:intl/intl.dart';

class OrderHistoryScreenTiles extends StatelessWidget {
  final List<Items> order;
  final String id;
  final List<CartModal> orderAgain;
  final String createdDate;
  final String orderNo;
  final String cancellationReason;

  const OrderHistoryScreenTiles(
    { Key? key,
      required this.id,
      required this.orderAgain,
      required this.order,
      required this.createdDate,
      required this.cancellationReason,
      required this.orderNo
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> returnChoices() {
      List<String> ans = [];
      int len = order.length;
      int n;
      if (len >= 3) {
        n = 3;
      } else {
        n = len;
      }

      for (int i = 0; i < n; i++) {
        ans.add(order[i].productName!);
      }
      if (len > 3) {
        ans.add("...");
      }
      return ans;
    }

    final role = context.watch<LoginAuthProvider>().role;
    final createddate = DateTime.parse(createdDate);
    final utcTime = DateTime.utc(
        createddate.year,
        createddate.month,
        createddate.day,
        createddate.hour,
        createddate.minute,
        createddate.second);
    final localTime = utcTime.toLocal();
    List<String> optionSelected = order.isEmpty ? [] : returnChoices();
    bool isclicked = false;
    final route = context.read<routing>().gettingroute;

    return GestureDetector(
      onTap: () async {
        if (isclicked == false) {
          isclicked = true;
          context
              .read<OrderHistory>()
              .getOrderhistory(context, id)
              .then((value) {
                var allData = context.read<MyData>().fetchData(context, id);
                orderDetailsDialog(context, value);
              }).whenComplete(() => isclicked = false);
        }
      },
      child: GlassContainer.frostedGlass(
        margin: EdgeInsets.only(top: 12.sp, bottom: 10.sp),
        height: cancellationReason == "" ? 22.h : 25.h ,
        width: 90.w,
        borderWidth: 0,
        blur: 17,
        frostedOpacity: 0.05,
        // color: Color.fromARGB(50, 255, 255, 255),
        gradient: LinearGradient(
            colors: glassShadeOrderList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderColor: Colors.white24,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 80.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          orderNo,
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 205, 205, 205),
                          ),
                        ),
                      ),
                      //for padding
                      SizedBox(
                        height: 0.3.h,
                      ),
                      Column(
                        children: optionSelected
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.all(0.5.w),
                                width: 20.w,
                                child: Text(
                                  e,
                                  style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    color: const Color.fromARGB(
                                        255, 205, 205, 205),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),

                      // veg symbol

                      //padding between inner row and discription

                      //discription text
                    ],
                  ),
                  GlassContainer.frostedGlass(
                    color: Colors.white38,
                    height: 8.h,
                    width: 18.w,
                    borderRadius: BorderRadius.circular(10),
                    // borderColor: Colors.white12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/coffee1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.8,
              color: Colors.white38,
              indent: 5.w,
              endIndent: 5.w,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 1.h),
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${localTime.day} ${DateFormat.MMM().format(localTime)} ${localTime.year} at ${localTime.hour}:${localTime.minute}",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, deliveryStatus,
                                arguments: [id, orderNo]);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Icon(
                              LineIcons.alternateMapMarked,
                              size: 19.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            await context.read<SetCafeTimings>().getCafeStatus( context );
                            if( context.read<SetCafeTimings>().isShopClosed! ) {
                              snakbarmethod(context, "Shop is closed, come some other time");
                            } else {
                              context
                                .read<CartProductsProvider>()
                                .orderAgain(orderAgain);
                              context.read<routing>().settingRoute(4);
                              if (route == 2) {
                                Navigator.pop(context);
                              }
                            }
                            
                          },
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.green.shade400),
                              padding: const EdgeInsets.all(1)),
                          child: Text(
                            "Order Again",
                            style: GoogleFonts.inter(
                                color: Colors.green.shade400,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: ( cancellationReason != "" ),
              child: Container(
                padding: EdgeInsets.only(bottom: 1.h),
                width: 80.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cancellationReason,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
