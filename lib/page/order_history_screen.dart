import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_history_model.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/order_history_screen_tiles.dart';
import 'package:provider/provider.dart';
import '../provider/order_history_provider.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List test = [1, 2, 3];
  List<OrderHistoryModel>? data;
  @override
  void initState() {
    OrderHistory orderHistory = context.read<OrderHistory>();
    orderHistory.init();
    orderHistory.fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int route = context.watch<routing>().gettingroute;
    OrderHistory orderHistory = context.watch<OrderHistory>();
    data = orderHistory.History;
    final isloading = orderHistory.isloading;
    final dataLoading = orderHistory.dataLoading;

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
                style: GoogleFonts.inter(
                    color: Theme.of(context).navigationBarTheme.backgroundColor,
                    fontSize: 17.sp)),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: route == 2
                  ? Image.asset(
                      "assets/ICONS/arrow3.png",
                      scale: 3,
                      color:
                          Theme.of(context).navigationBarTheme.backgroundColor,
                    )
                  : const SizedBox(),
            ),
            backgroundColor:
                Theme.of(context).navigationBarTheme.surfaceTintColor,
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
                                                  "No Data Available 📪",
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white70),
                                                )),
                                          ))
                                      : Column(
                                          children: data!.map((e) {
                                            return OrderHistoryScreenTiles(
                                              id: e.id!,
                                              orderAgain: e.orderagain!,
                                              order: e.items!,
                                              orderNo: e.orderNo!,
                                              createdDate: e.createdDate!,
                                              cancellationReason: e.cancellationReason!
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
