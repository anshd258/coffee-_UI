import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/ordertiles.dart';
import 'package:provider/provider.dart';
import '../provider/OrderHistoryProvider.dart';

class OrderPg extends StatefulWidget {
  const OrderPg({super.key});

  @override
  State<OrderPg> createState() => _OrderPgState();
}

class _OrderPgState extends State<OrderPg> {
  List test = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    final data = context.watch<OrderHistory>().History;
    print(data.isEmpty);
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
        frostedOpacity: 0,
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
            title: Text("Order List",
                textAlign: TextAlign.start,
                style:
                    GoogleFonts.inter(color: titleStatusBar, fontSize: 17.sp)),
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
          body: SizedBox(
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: 100.w,
                    height: 90.h,
                    child: SingleChildScrollView(
                        child: data.isEmpty
                            ? CircularProgressIndicator()
                            : Column(
                                children: data.map((e) {
                                  return OrderPgTiles(
                                    order: e,
                                  );
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
