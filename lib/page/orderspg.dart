import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_history_model.dart';
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
  List<OrderHistoryModel>? data;
  @override
  void initState() {
    context.read<OrderHistory>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = context.watch<OrderHistory>().History;
    final isloading = context.watch<OrderHistory>().isloading;
    final dataLoading = context.watch<OrderHistory>().dataLoading;

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
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/ICONS/arrow3.png",
                scale: 3,
                color: titleStatusBar,
              ),
            ),
            backgroundColor: bgStatusBar,
          ),
          body: Stack(
            children: [
              SizedBox(
                child: Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      isloading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white70)),
                            )
                          : SizedBox(
                              width: 100.w,
                              height: 90.h,
                              child: SingleChildScrollView(
                                  child: data!.isEmpty && data != null
                                      ? SizedBox(
                                          height: 100.h,
                                          width: 100.w,
                                          child: Center(
                                            child: Container(
                                                width: 100.w,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "No Data Avilable 📪",
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white70),
                                                )),
                                          ))
                                      : Column(
                                          children: data!.map((e) {
                                            return OrderPgTiles(
                                              id: e.id!,
                                              orderAgain: e.orderagain!,
                                              order: e.items!,
                                              orderNo: e.orderNo!,
                                              createdDate: e.createdDate!,
                                            );
                                          }).toList(),
                                        )),
                            ),
                    ],
                  ),
                ),
              ),
              if (dataLoading == true) ...[
                Container(
                  color: Colors.black38,
                  child: const Center(
                      child: CircularProgressIndicator.adaptive(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white70))),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
