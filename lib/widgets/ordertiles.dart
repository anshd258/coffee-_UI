import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_history_model.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:inter_coffee/widgets/Admin/OrderDetailsDialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';
import '../provider/loginAuthProvider.dart';
import 'package:intl/intl.dart';

class OrderPgTiles extends StatelessWidget {
  final Items order;
  final String id;
  final List<CartModal> orderAgain;
  final String createdDate;
  final String orderNo;
  const OrderPgTiles(
      {Key? key,
      required this.id,
      required this.orderAgain,
      required this.order,
      required this.createdDate,
      required this.orderNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String returnChoices() {
      String ans = "";
      int len = order.choice!.length;
      int n;
      if (len >= 3) {
        n = 3;
      } else {
        n = len;
      }

      for (int i = 0; i < n; i++) {
        if (ans == "") {
          ans += order.choice![i].choice!.first;
        } else if (i == 2) {
          ans += '''

${order.choice![i].choice!.first}''';
        } else {
          ans += "                        ${order.choice![i].choice!.first}";
        }
      }
      return ans;
    }

    final role = context.watch<LoginAuthProvider>().role;
    final createddate = DateTime.parse(createdDate);
    final optionSelected = order.choice!.isEmpty ? "" : returnChoices();

    return GlassContainer.frostedGlass(
      margin: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
      height: 19.h,
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
                    Text(
                      order.productName!,
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 205, 205, 205),
                      ),
                    ),

                    //pading
                    SizedBox(
                      height: 0.8.h,
                    ),
                    //inner row

                    //for showing ratings
                    // Row(
                    //   children: [
                    //     if (role == 'admin') ...[
                    //       Text(
                    //         // "priority: ${order.priority.toString()}",
                    //         "priority: No Data!!!",
                    //         style: GoogleFonts.inter(
                    //           fontSize: 13.sp,
                    //           color: const Color.fromARGB(255, 205, 205, 205),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 20.w,
                    //       ),
                    //     ],
                    //     Text(
                    //       "${createddate.hour}:${createddate.minute}",
                    //       style: GoogleFonts.inter(
                    //           color: const Color.fromARGB(255, 197, 197, 197),
                    //           fontSize: 13.sp,
                    //           textStyle: const TextStyle(
                    //             wordSpacing: 1,
                    //           )),
                    //     ),
                    //     SizedBox(width: 10.w)
                    //   ],
                    // ),
                    //for padding
                    SizedBox(
                      height: 01.h,
                    ),
                    Container(
                      width: 60.w,
                      child: Text(
                        optionSelected.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: const Color.fromARGB(255, 205, 205, 205),
                        ),
                      ),
                    ),
                    //for padding
                    SizedBox(
                      width: 5.w,
                    ),
                    // veg symbol

                    //padding between inner row and discription
                    SizedBox(
                      height: 0.5.h,
                    ),
                    //discription text
                  ],
                ),

                // SizedBox(width: 30.w),
                GlassContainer.frostedGlass(
                  color: Colors.white38,
                  height: 8.h,
                  width: 18.w,
                  borderRadius: BorderRadius.circular(10),
                  // borderColor: Colors.white12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      order.productImg!,
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
          SizedBox(
            width: 80.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${createddate.day} ${DateFormat.MMM().format(createddate)} ${createddate.year} at ${createddate.hour}:${createddate.minute}",
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
                          Navigator.pushNamed(context, "/deliveryStatus",
                              arguments: id);
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
                        onPressed: () {
                          context
                              .read<CartProductsProvider>()
                              .orderAgain(orderAgain);
                          context.read<routing>().settingRoute(4);
                          Navigator.pop(context);
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
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
