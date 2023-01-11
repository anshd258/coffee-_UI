import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: GlassContainer.clearGlass(
        blur: 10,
        height: 100.h,
        width: 100.w,
        borderWidth: 0,
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("Swift Café ",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 2.w)),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            backgroundColor: Colors.white24,
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
                      borderColor: Colors.transparent,
                      margin: EdgeInsets.only(top: 2.8.h),
                      height: 55.h,
                      width: 85.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/cp1.png", scale: 0.13.w),
                              Text(
                                "Order Completed Successfully !",
                                style: GoogleFonts.inter(
                                    fontSize: 4.w,
                                    color: const Color.fromARGB(
                                        255, 197, 197, 197)),
                              ),
                              Text(
                                "Thank You",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 3.w,
                                    color: const Color.fromARGB(
                                        255, 197, 197, 197)),
                              ),
                            ],
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/orderspg");
                    },
                    child: Text(
                      "Order Details",
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(68.w, 4.h),
                        backgroundColor: Colors.greenAccent.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
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
