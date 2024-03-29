import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailspg extends StatefulWidget {
  const OrderDetailspg({super.key});

  @override
  State<OrderDetailspg> createState() => _OrderDetailspgState();
}

class _OrderDetailspgState extends State<OrderDetailspg> {
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
        // color: Color.fromARGB(15, 255, 255, 255),
        gradient: LinearGradient(
            colors: allScreenBGGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("Order Status",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    color: titleStatusBar,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600)),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                "assets/ICONS/arrow3.png",
                scale: 3,
                color: titleStatusBar,
              ),
            ),
            backgroundColor: bgStatusBar,
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
                      // color: Color.fromARGB(40, 255, 255, 255),
                      gradient: LinearGradient(
                          colors: glassShadeConfirmOrder,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderColor: Colors.white38,
                      frostedOpacity: 0.04,
                      margin: EdgeInsets.only(top: 2.8.h),
                      height: 55.h,
                      width: 85.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 54.h,
                            width: 84.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: 35.h,
                                    alignment: Alignment.centerRight,
                                    width: 65.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/cp1.png",
                                            ),
                                            fit: BoxFit.contain)),
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      height: 10.h,
                                      width: 20.w,
                                      child: Image.asset(
                                          "assets/greencheck.png",
                                          scale: 1),
                                    )),
                                Column(
                                  children: [
                                    Text(
                                      "Order Completed Successfully !",
                                      style: GoogleFonts.inter(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Thank You",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // AnimatedOpacity(
                          //     opacity: visible ? 1.0 : 0.0, duration: Duration(seconds: 3), child: Image.asset(name),) //TODO animation green tick mark
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 9.w,
                  right: 9.w,
                  bottom: 3.h,
                  child: Container(
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
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
