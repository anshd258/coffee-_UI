import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/orderStautsProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  Color green = const Color(0xff4CAF50);
  Color red = const Color(0xffd50000);
  Color white = const Color(0xffcdcdcd);
  Color checkColor = const Color(0xfffafafa);

  String? EStime;
  String stateOfOrder = "";
  String orderid = "no value";
  String orderNo = "No Value";
  Timer? timer;
  @override
  void initState() {
    context.read<MyData>().fetchData(orderid);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          context.read<MyData>().fetchData(orderid);
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    stateOfOrder = "";
    timer!.cancel();
    context.read<MyData>().clearPrevoiusStatus();
    super.dispose();
  }

  int checkState(String state) {
    int ans = 0;
    switch (state) {
      case "ORDER_COMPLETED":
        ans = 5;
        break;
      case "ORDER_READY_FOR_PICKUP":
        ans = 4;
        break;
      case "ORDER_IN_PROGRESS":
        ans = 3;
        break;
      case "ORDER_CONFIRMED":
        ans = 2;
        break;
      case "ORDER_CANCELLED":
        ans = -2;
        break;
      case "ORDER_PLACED":
        ans = 1;
        break;
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    List<String> args =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args != null) {
      orderid = args.first.toString();
      orderNo = args[1].toString();
      print(orderid);
    }

    if (context.watch<MyData>().orderState != null) {
      stateOfOrder = context.watch<MyData>().orderState!;
      if (context.read<MyData>().estTime != null) {
        final time = context.watch<MyData>().estTime!;
        var finalTime = DateTime.parse(time);
        var diff = finalTime.toLocal().difference(DateTime.now());
        int days = diff.inDays.abs();
        int hours = diff.inHours.abs().remainder(24);
        int minutes = diff.inMinutes.abs().remainder(60);
        int seconds = diff.inSeconds.abs().remainder(60);
        var durationString = "${diff.isNegative ? "-" : ""}"
            "${days > 0 ? '$days d ' : ''}"
            "${hours > 0 ? '$hours h ' : ''}"
            "${minutes > 0 ? '$minutes m ' : ''}"
            "${seconds > 0 ? '$seconds s' : ''}";
        EStime = durationString;
      }
    }

    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bg1.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.frostedGlass(
        height: 100.h,
        width: 100.w,
        borderWidth: 0,
        blur: 17,
        frostedOpacity: 0.03,
        color: const Color.fromARGB(15, 255, 255, 255),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("Delivery Status",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600)),
            leading: GestureDetector(
              onTap: () {
                timer!.cancel();
                stateOfOrder = "";
                context.read<MyData>().clearPrevoiusStatus();
                Navigator.pop(context);
              },
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            backgroundColor: Colors.white12,
          ),
          body: Center(
            child: Stack(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 90.h,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GlassContainer.frostedGlass(
                      borderRadius: BorderRadius.circular(10),
                      borderWidth: 0.5,
                      color: const Color.fromARGB(40, 255, 255, 255),
                      borderColor: Colors.white38,
                      frostedOpacity: 0.04,
                      margin: EdgeInsets.only(top: 2.8.h),
                      height: 80.h,
                      width: 85.w,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                  left: 35,
                                  top: 30,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 3.w),
                                        child: Image.asset("assets/cp1.png",
                                            scale: 4)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Center(
                                            child: Text(orderNo,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.inter(
                                                    color: white,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 3,
                                        // ),
                                      ],
                                    )
                                  ],
                                )),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 30, top: 15, right: 30),
                              height: 3,
                              color: white,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                // check box 1
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: checkState(stateOfOrder) >= 1
                                              ? green
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      child: Transform.scale(
                                        scale: 1.6,
                                        child: Checkbox(
                                          value: checkState(stateOfOrder) >=
                                                      1 ||
                                                  checkState(stateOfOrder) == -2
                                              ? true
                                              : false,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   _value1 = value;
                                            // });
                                          },
                                          side: BorderSide(
                                            color: white,
                                          ),
                                          activeColor: green,
                                          checkColor: checkColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text("Order Placed",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 44,
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      height: 40,
                                      width: 4,
                                      color: checkState(stateOfOrder) >= 1
                                          ? green
                                          : white,
                                    )
                                  ],
                                ),
                                // check box 2
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: checkState(stateOfOrder) == -2
                                              ? red
                                              : checkState(stateOfOrder) >= 2
                                                  ? green
                                                  : white,
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      width: 32,
                                      height: 32,
                                      child: Transform.scale(
                                        scale: 1.6,
                                        child: Checkbox(
                                          value: checkState(stateOfOrder) >= 2,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   _value2 = value;
                                            // });
                                          },
                                          side: BorderSide(
                                            color: white,
                                          ),
                                          activeColor:
                                              checkState(stateOfOrder) == -2
                                                  ? red
                                                  : green,
                                          checkColor: checkColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                        checkState(stateOfOrder) == -2
                                            ? "Order Cancelled"
                                            : "Order Confirmed",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 44,
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      height: 40,
                                      width: 4,
                                      color: checkState(stateOfOrder) >= 2
                                          ? green
                                          : white,
                                    )
                                  ],
                                ),
                                // check box 3
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: checkState(stateOfOrder) >= 3
                                              ? green
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      width: 32,
                                      height: 32,
                                      child: Transform.scale(
                                        scale: 1.6,
                                        child: Checkbox(
                                          value: checkState(stateOfOrder) >= 3,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   _value3 = value;
                                            // });
                                          },
                                          side: BorderSide(
                                            color: white,
                                          ),
                                          activeColor: green,
                                          checkColor: checkColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text("Order in Progress",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 44,
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      height: 40,
                                      width: 4,
                                      color: checkState(stateOfOrder) >= 3
                                          ? green
                                          : white,
                                    )
                                  ],
                                ),
                                // check box 4
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: checkState(stateOfOrder) >= 4
                                              ? green
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      width: 32,
                                      height: 32,
                                      child: Transform.scale(
                                        scale: 1.6,
                                        child: Checkbox(
                                          value: checkState(stateOfOrder) >= 4,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   _value4 = value;
                                            // });
                                          },
                                          side: BorderSide(
                                            color: white,
                                          ),
                                          activeColor: green,
                                          checkColor: checkColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text("Order Ready to Pick Up",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 44,
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      height: 40,
                                      width: 4,
                                      color: checkState(stateOfOrder) >= 4
                                          ? green
                                          : white,
                                    )
                                  ],
                                ),
                                // check box 5
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: checkState(stateOfOrder) >= 5
                                              ? green
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      width: 32,
                                      height: 32,
                                      child: Transform.scale(
                                        scale: 1.6,
                                        child: Checkbox(
                                          value: checkState(stateOfOrder) >= 5,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   _value5 = value;
                                            // });
                                          },
                                          side: BorderSide(
                                            color: white,
                                          ),
                                          activeColor: green,
                                          checkColor: checkColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text("Order Completed",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Text(
                                    (EStime == null ||
                                            (stateOfOrder !=
                                                    "ORDER_CONFIRMED" &&
                                                stateOfOrder !=
                                                    "ORDER_IN_PROGRESS"))
                                        ? ""
                                        : "Expected Time Delivery: ${EStime ?? "_"}",
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                // Center(
                                //   child: Container(
                                //     width: 85.w,
                                //     padding:
                                //         EdgeInsets.only(left: 9.w, right: 9.w),
                                //     child: ElevatedButton(
                                //       onPressed: () {},
                                //       style: ElevatedButton.styleFrom(
                                //           elevation: 5,
                                //           fixedSize: Size(50.w, 4.5.h),
                                //           backgroundColor:
                                //               Colors.greenAccent.shade700,
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(7))),
                                //       child: Text(
                                //         "Order Details",
                                //         style: GoogleFonts.inter(
                                //             color: Colors.white,
                                //             fontSize: 16.sp.sp,
                                //             fontWeight: FontWeight.w600,
                                //             letterSpacing: 1),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
