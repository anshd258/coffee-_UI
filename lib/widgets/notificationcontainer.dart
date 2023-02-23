import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/notificationmodal.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class notificationContainer extends StatefulWidget {
  final NotificatonModal notification;
  const notificationContainer({super.key, required this.notification});

  @override
  State<notificationContainer> createState() => _notificationContainerState();
}

class _notificationContainerState extends State<notificationContainer> {
  String orderid = '';
  @override
  Widget build(BuildContext context) {
    if (widget.notification.orderId!.isNotEmpty) {
      orderid = widget.notification.orderId!.substring(
          widget.notification.orderId!.length - 10,
          widget.notification.orderId!.length);
      print(orderid);
    }
    return GlassContainer.frostedGlass(
      borderWidth: 0.5,
      height: 13.h,
      width: 90.w,
      frostedOpacity: 0.05,
      margin: EdgeInsets.symmetric(vertical: 0.7.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
          colors: glassShadeOrderList,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      child: Row(children: [
        Container(
          height: 9.h,
          width: 9.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/coffee1.png"))),
        ),
        Container(
          padding: EdgeInsets.only(left: 5.w, top: 1.h, bottom: 1.h
              // bottom: 5.w,
              ),
          alignment: Alignment.centerLeft,
          width: 62.w,
          // height: 15.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.notification.title!,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 205, 205, 205),
                ),
              ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: orderid,
              //         style: GoogleFonts.inter(
              //             fontSize: 15.sp,
              //             fontWeight: FontWeight.w600,
              //             color:
              //                 //  widget.notification.orderstate!.completed
              //                 //     ?
              //                 Colors.green
              //             // : widget.notification.orderstate!.inprocess
              //             //     ? Colors.amber.shade300
              //             //     : Colors.red
              //             ),
              //       ),
              //     ],
              //   ),
              // ),
              Text(
                widget.notification.body!,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(205, 205, 205, 205),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
