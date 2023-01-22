import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/widgets/Admin/AdminHomeRowContainer.dart';
import 'package:inter_coffee/widgets/namebar2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widgets/Admin/adminOrderCountContainer.dart';

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
          color: Colors.black38,
          borderColor: Colors.transparent,
          padding: EdgeInsets.only(top: 8.h),
          child: Column(
            children: [
              name_bar2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminOrderCountContainer(),
                  AdminOrderCountContainer()
                ],
              ),
              AdminHomeRowContainer(
                coffeeName: "Cappuccino",
                coffeeDetails: "1/2 Full  Vanilla Syrup  Sugar X1",
                onTap: () {
                  Navigator.pushNamed(context, "/OrdersAdmin");
                },
              )
            ],
          ),
        ),
      ),

      // BROWN gradient over the image

      //main glass container aith all the content

      //bottom nav bar with functionality
    );
  }
}
