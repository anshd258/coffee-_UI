import '../../widgets/Admin/OrderETA_Dialog.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/widgets/Admin/AdminHomeRowContainer.dart';
import 'package:inter_coffee/widgets/namebar2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widgets/Admin/adminOrderCountContainer.dart';
import '../../widgets/Admin/ConfirmationDialog.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          //stack for bottom nav bar  base image gradeint

          //base image of the page
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
          color: const Color.fromRGBO(0, 0, 0, 0.36),
          borderColor: Colors.transparent,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                GestureDetector(
                    onTap: () async {
                      await ConfirmDialog(context, 'Are you sure to Confirm');
                    },
                    child: name_bar2()),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: (3.h) / 2,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          color: greyBG,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AdminOrderCountContainer(
                                title: "Priority Orders",
                                quantity: 4,
                                onTap: () {
                                  Navigator.pushNamed(context, "/OrdersAdmin");
                                },
                              ),
                              AdminOrderCountContainer(
                                title: "Total Orders",
                                quantity: 12,
                                onTap: () {
                                  Navigator.pushNamed(context, "/OrdersAdmin");
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          color: const Color.fromRGBO(0, 0, 0, 0.36),
                          child: Column(
                            children: [
                              SizedBox(
                                height: (3.h) / 2,
                              ),
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
                                          context, "/OrdersAdmin");
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
                                height: (3.h) / 2,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    AdminHomeRowContainer(
                                      coffeeName: "Cappuccino",
                                      coffeeDetails:
                                          "1/2 Full  Vanilla Syrup  Sugar X1",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/OrdersAdmin");
                                      },
                                    ),
                                    AdminHomeRowContainer(
                                      coffeeName: "Cappuccino",
                                      coffeeDetails:
                                          "1/2 Full  Vanilla Syrup  Sugar X1",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/OrdersAdmin");
                                      },
                                    ),
                                    AdminHomeRowContainer(
                                      coffeeName: "Cappuccino",
                                      coffeeDetails:
                                          "1/2 Full  Vanilla Syrup  Sugar X1",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/OrdersAdmin");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: (5.h) / 2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          color: const Color.fromRGBO(0, 0, 0, 0.36),
                          child: Column(
                            children: [
                              SizedBox(
                                height: (3.h) / 2,
                              ),
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
                                          context, "/OrdersAdmin");
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
                                height: (3.h) / 2,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    AdminHomeRowContainer(
                                      coffeeName: "Cappuccino",
                                      coffeeDetails:
                                          "1/2 Full  Vanilla Syrup  Sugar X1",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/OrdersAdmin");
                                      },
                                    ),
                                    AdminHomeRowContainer(
                                      coffeeName: "Cappuccino",
                                      coffeeDetails:
                                          "1/2 Full  Vanilla Syrup  Sugar X1",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/OrdersAdmin");
                                      },
                                    ),
                                    AdminHomeRowContainer(
                                      coffeeName: "Cappuccino",
                                      coffeeDetails:
                                          "1/2 Full  Vanilla Syrup  Sugar X1",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/OrdersAdmin");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: (5.h) / 2,
                              ),
                            ],
                          ),
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

      // BROWN gradient over the image

      //main glass container aith all the content

      //bottom nav bar with functionality
    );
  }
}
