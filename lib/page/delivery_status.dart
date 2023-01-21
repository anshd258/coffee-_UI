import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  Color green = const Color(0xff4CAF50);
  Color white = const Color(0xffcdcdcd);
  Color checkColor = const Color(0xfffafafa);
  bool? _value1 = false;
  bool? _value2 = false;
  bool? _value3 = false;
  bool? _value4 = false;
  bool? _value5 = false;
  // bool visible = false;
  @override
  Widget build(BuildContext context) {
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
              onTap: () => Navigator.pop(context),
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
                      height: 85.h,
                      width: 85.w,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 35, top: 30, right: 26.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/cp1.png", scale: 4),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("1 Latte",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500
                                      )
                                    ),
                                    const SizedBox(height: 3,),
                                    Text("Full, Full Cream Milk, Sugar X 1",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w200
                                      )
                                    ),
                                    const SizedBox(height: 8,),
                                    Text("#Order000001",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500
                                      )
                                    ),
                                  ],
                                )
                              ],
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30, top: 15, right: 30),
                            height: 3,
                            color: white,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30,),
                              // check box 1
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 30,),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _value1== true ? green:white,
                                      borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    child: Transform.scale(
                                      scale: 1.6,
                                      child: Checkbox(
                                        value: _value1,
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                          });
                                        },
                                        side: BorderSide( color: white,),
                                        activeColor: green,
                                        checkColor: checkColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Text("Order Placed",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 44, height: 20,),
                                  Container(
                                    margin: const EdgeInsets.only(top: 0),
                                    height: 40,
                                    width: 4,
                                    color: _value1 ?? true ? green : white,
                                  )
                                ],
                              ),
                              // check box 2
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 30,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _value2== true ? green:white,
                                      borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    width: 32,
                                    height: 32,
                                    child: Transform.scale(
                                      scale: 1.6,
                                      child: Checkbox(
                                        value: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value;
                                          });
                                        },
                                        side: BorderSide( color: white,),
                                        activeColor: green,
                                        checkColor: checkColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Text("Order Confirmed",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 44, height: 20,),
                                  Container(
                                    margin: const EdgeInsets.only(top: 0),
                                    height: 40,
                                    width: 4,
                                    color: _value2 ?? true ? green : white,
                                  )
                                ],
                              ),
                              // check box 3
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 30,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _value3== true ? green:white,
                                      borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    width: 32,
                                    height: 32,
                                    child: Transform.scale(
                                      scale: 1.6,
                                      child: Checkbox(
                                        value: _value3,
                                        onChanged: (value) {
                                          setState(() {
                                            _value3 = value;
                                          });
                                        },
                                        side: BorderSide( color: white,),
                                        activeColor: green,
                                        checkColor: checkColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Text("Order in Progress",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 44, height: 20,),
                                  Container(
                                    margin: const EdgeInsets.only(top: 0),
                                    height: 40,
                                    width: 4,
                                    color: _value3 ?? true ? green : white,
                                  )
                                ],
                              ),
                              // check box 4
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 30,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _value4== true ? green:white,
                                      borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    width: 32,
                                    height: 32,
                                    child: Transform.scale(
                                      scale: 1.6,
                                      child: Checkbox(
                                        value: _value4,
                                        onChanged: (value) {
                                          setState(() {
                                            _value4 = value;
                                          });
                                        },
                                        side: BorderSide( color: white,),
                                        activeColor: green,
                                        checkColor: checkColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Text("Order Ready to Pick Up",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 44, height: 20,),
                                  Container(
                                    margin: const EdgeInsets.only(top: 0),
                                    height: 40,
                                    width: 4,
                                    color: _value4 ?? true ? green : white,
                                  )
                                ],
                              ),
                              // check box 5
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 30,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _value5== true ? green:white,
                                      borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    width: 32,
                                    height: 32,
                                    child: Transform.scale(
                                      scale: 1.6,
                                      child: Checkbox(
                                        value: _value5,
                                        onChanged: (value) {
                                          setState(() {
                                            _value5 = value;
                                          });
                                        },
                                        side: BorderSide( color: white,),
                                        activeColor: green,
                                        checkColor: checkColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Text("Order Completed",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),
                              Center(
                                child: Text(
                                  "Expected Time Delivery: 10 mins",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Center(
                                child: Container(
                                  width: 85.w,
                                  padding: EdgeInsets.only(left: 9.w, right: 9.w),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/orderspg");
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        fixedSize: Size(50.w, 4.5.h),
                                        backgroundColor: Colors.greenAccent.shade700,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(7))),
                                    child: Text(
                                      "Order Details",
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 16.sp.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
