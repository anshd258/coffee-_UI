import 'package:flutter/material.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/page/cart_screen.dart';
import 'package:inter_coffee/page/product_screen.dart';
import 'package:inter_coffee/page/profile_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/product_list_bottom_navbar.dart';
import 'package:provider/provider.dart';
import '../provider/router.dart';
import 'Admin/merchant_home_screen.dart';
import 'notification_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final id = context.watch<routing>().gettingroute;
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(children: [
        if (id == 1) ...[
          const ProductListScreen()
        ] else if (id == 2) ...[
          const ProfileScreen()
        ] else if (id == 3) ...[
          const NotificationScreen()
        ] else if (id == 4) ...[
          const CartScreen()
        ] else if (id == 5) ...[
          const MerchantHomeScreen(),
        ] else if (id == 6) ...[
          const AllOrdersTable()
        ],
        Positioned(
          bottom: -0.5.h,
          left: 1.w,
          right: 1.w,
          child: const ProductListScreenBottomNavBar(),
        )
      ]),
    );
  }
}
