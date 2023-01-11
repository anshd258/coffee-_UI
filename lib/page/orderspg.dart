import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/ordertiles.dart';

class OrderPg extends StatefulWidget {
  const OrderPg({super.key});

  @override
  State<OrderPg> createState() => _OrderPgState();
}

class _OrderPgState extends State<OrderPg> {
  List test = [1, 2, 3, 4, 5, 6, 7, 8];
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
        borderColor: Colors.black54,
        child: Scaffold(
          backgroundColor: Colors.black54,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("Order List",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 16.sp)),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            backgroundColor: Colors.white24,
          ),
          body: SizedBox(
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: 100.w,
                    height: 90.h,
                    child: SingleChildScrollView(
                        child: Column(
                      children: test.map((e) {
                        return OrderPgTiles();
                      }).toList(),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
