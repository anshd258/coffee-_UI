import 'package:flutter/material.dart';
import 'package:inter_coffee/page/Admin/merchant_home_screen.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/page/Admin/priority_table.dart';
import 'package:inter_coffee/page/Merchent/create_order_merchant.dart';
import 'package:inter_coffee/page/notification_screen.dart';
import 'package:inter_coffee/page/profile_screen.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:inter_coffee/widgets/Merchant/merchant_navbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class BottomNavBarMerchant extends StatefulWidget {
  const BottomNavBarMerchant({super.key});

  @override
  State<BottomNavBarMerchant> createState() => _BottomNavBarMerchantState();
}

class _BottomNavBarMerchantState extends State<BottomNavBarMerchant> {
  @override
  Widget build(BuildContext context) {
    final id = context.watch<routing>().gettingroute;
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(children: [
        if (id == 1) ...[
          const MerchantHomeScreen()
        ] else if (id == 2) ...[
          const ProfileScreen()
        ] else if (id == 3) ...[
          const AllOrdersTable(),
        ] else if (id == 4) ...[
          const NotificationScreen()
        ] else if (id == 5) ...[
          const PriorityTable(),
        ] else if (id == 6) ...[
          const CreateOrderMerchant(),
        ],
        Positioned(
          bottom: -0.5.h,
          left: 1.w,
          right: 1.w,
          child: const MerchantNavBar(),
        )
      ]),
    );
  }
}
