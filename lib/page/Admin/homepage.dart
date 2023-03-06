import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_details_model.dart';
import 'package:inter_coffee/provider/OrderHistoryProvider.dart';
import 'package:inter_coffee/provider/merchantProvider/allOrderwithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/totalordercount.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:inter_coffee/widgets/Admin/AdminHomeRowContainer.dart';
import 'package:inter_coffee/widgets/Admin/loginExpiredDialog.dart';
import 'package:inter_coffee/widgets/namebar2.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../provider/merchantProvider/priorityOrderWithStatus.dart';
import '../../widgets/Admin/adminOrderCountContainer.dart';
import '../../provider/merchantProvider/priorityordercount.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final List products = [
    {
      "productid": 0123,
      "name": "latte",
      "quantity": 2,
      "choices": ["full", "2 X suger", "2 x choclate"]
    },
    {
      "productid": 0123,
      "name": "cappucino",
      "quantity": 1,
      "choices": ["full", "2 X suger", "2 x choclate"]
    },
    {
      "productid": 0123,
      "name": "esprresso",
      "quantity": 3,
      "choices": ["full", "2 X suger", "2 x choclate"]
    },
  ];
  @override
  void initState() {
    getproducts();
    context.read<userDetailsProvider>().getUserDetails();
    context.read<PriorityOrderCount>().getCount();
    context.read<TotalOrderCount>().getCount();

    context.read<PriorityOrderProvider>().getPriorityOrders();
    super.initState();
  }

  void getproducts() async {
    final response = await context.read<AllOrderProvider>().getOrders();

    if (response == "token expired") {
      tokkenExpiredDialog(context, "Login Has Expired Please login Again");
    }
  }

  List<OrderDetails>? listOfOrders;
  List<OrderDetails>? priorityOrder;
  @override
  Widget build(BuildContext context) {
    final dataLoading = context.watch<OrderHistory>().dataLoading;
    final priorityCount = context.watch<PriorityOrderCount>().count;
    final totalCount = context.watch<TotalOrderCount>().count;
    listOfOrders = context.watch<AllOrderProvider>().orders;
    priorityOrder = context.watch<PriorityOrderProvider>().priorityOrders;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          //stack for bottom nav bar  base image gradeint

          //base image of the page
          Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/AdminBG.jpg"),
              ),
            ),
            child: GlassContainer.frostedGlass(
              height: 100.h,
              width: 100.w,
              blur: 17,
              frostedOpacity: 0.05,
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.43),
                    Color.fromRGBO(0, 0, 0, 0.85)
                  ]),
              borderColor: Colors.transparent,
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/AdminAccount");
                        },
                        child: const name_bar2()),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 1.h),
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              color: greyBG,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AdminOrderCountContainer(
                                    title: "Priority Orders",
                                    quantity: priorityCount,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/OrdersAdmin");
                                    },
                                  ),
                                  AdminOrderCountContainer(
                                    title: "Total Orders",
                                    quantity: totalCount,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/OrdersAdmin");
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.5.h),
                              color: Colors.white10,
                              // height: 34.h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Priority Orders",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/AllOrders",
                                              arguments: [
                                                "priority Orders",
                                                priorityOrder
                                              ]);
                                        },
                                        child: Text(
                                          "View All",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: priorityOrder == null
                                              ? [
                                                  const CircularProgressIndicator
                                                      .adaptive(),
                                                ]
                                              : priorityOrder!.isEmpty
                                                  ? [
                                                      Center(
                                                        child: Text(
                                                          "No Priority Orders To Display 😓",
                                                          style: GoogleFonts
                                                              .quicksand(
                                                                  fontSize:
                                                                      17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white70),
                                                        ),
                                                      )
                                                    ]
                                                  : priorityOrder!.map((e) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 4.w),
                                                        child:
                                                            AdminHomeRowContainer(
                                                          orderNo: e.orderNo,
                                                          items: e.items,
                                                          orderId: e.orderId,
                                                        ),
                                                      );
                                                    }).toList())),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.h, bottom: 8.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.h),
                              color: Colors.white10,
                              // height: 37.h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Orders",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/AllOrders",
                                              arguments: [
                                                "Total Orders",
                                                listOfOrders
                                              ]);
                                        },
                                        child: Text(
                                          "View All",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: listOfOrders == null
                                            ? [
                                                const CircularProgressIndicator
                                                    .adaptive()
                                              ]
                                            : listOfOrders!.isEmpty
                                                ? [
                                                    Center(
                                                      child: Text(
                                                        "No Orders To Display 😓",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                                fontSize: 17.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white70),
                                                      ),
                                                    )
                                                  ]
                                                : listOfOrders!.map((e) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 4.w),
                                                      child:
                                                          AdminHomeRowContainer(
                                                        orderNo: e.orderNo,
                                                        items: e.items,
                                                        orderId: e.orderId,
                                                      ),
                                                    );
                                                  }).toList()),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (dataLoading) ...[
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

      // BROWN gradient over the image

      //main glass container aith all the content

      //bottom nav bar with functionality
    );
  }
}
