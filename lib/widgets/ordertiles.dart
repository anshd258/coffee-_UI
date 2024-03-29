import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../models/order_details_model.dart';
import 'package:provider/provider.dart';

import '../provider/loginAuthProvider.dart';

class OrderPgTiles extends StatelessWidget {
  final Data order;
  const OrderPgTiles({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    final createddate = DateTime.parse(order.createdDate!);
    return GestureDetector(
      onTap: () {},
      child: GlassContainer.frostedGlass(
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
                        order.orderNo!,
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
                      Row(
                        children: [
                          if (role == 'admin') ...[
                            Text(
                              "priority: ${order.priority.toString()}",
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                color: const Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                          ],
                          Text(
                            order.currentState!,
                            style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 197, 197, 197),
                                fontSize: 13.sp,
                                textStyle: const TextStyle(
                                  wordSpacing: 1,
                                )),
                          ),
                          SizedBox(width: 10.w)
                        ],
                      ),
                      //for padding
                      SizedBox(
                        height: 01.h,
                      ),
                      Text(
                        "FULL CREAM MILK",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: const Color.fromARGB(255, 205, 205, 205),
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
                    borderColor: Colors.white12,
                    child: Center(
                      child: Image.asset(
                        "assets/3.png",
                        height: 12.h,
                        width: 23.w,
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
                children: [
                  Text(
                    "${createddate.day}/${createddate.month}/${createddate.year} ",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                    width: 18.w,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/deliveryStatus");
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
