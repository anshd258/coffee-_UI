import 'package:flutter/material.dart';
import 'package:inter_coffee/page/Admin/homepage.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/page/Admin/priorityTable.dart';
import 'package:inter_coffee/page/notificationpg.dart';
import 'package:inter_coffee/page/profilepg.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:inter_coffee/widgets/Merchant/merchant_navbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class ToggleMerchant extends StatefulWidget {
  const ToggleMerchant({super.key});

  @override
  State<ToggleMerchant> createState() => _ToggleMerchantState();
}

class _ToggleMerchantState extends State<ToggleMerchant> {
  @override
  Widget build(BuildContext context) {
    final id = context.watch<routing>().gettingroute;
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(children: [
        if (id == 1) ...[
          const AdminHome()
        ] else if (id == 2) ...[
          const Profilepg()
        ] else if (id == 3) ...[
          const Orders(),
        ] else if (id == 4) ...[
          const NotificationPg()
        ] else if (id == 5) ...[
          const PriorityTable(),
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
