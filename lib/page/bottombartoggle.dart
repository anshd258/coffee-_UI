import 'package:flutter/material.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/provider/merchantProvider/allOrderwithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/priorityOrderWithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/totalordercount.dart';
import 'package:inter_coffee/widgets/namebar2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/merchantProvider/priorityordercount.dart';
import './page-2.dart';
import './profilepg.dart';
import './order-confirmation-pg.dart';
import '../widgets/PG2bottomnavbar.dart';
import 'package:provider/provider.dart';
import '../provider/router.dart';
import 'Admin/homepage.dart';
import './notificationpg.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    final id = context.watch<routing>().gettingroute;
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(children: [
        if (id == 1) ...[
          const page_2()
        ] else if (id == 2) ...[
          const Profilepg()
        ] else if (id == 3) ...[
          const NotificationPg()
        ] else if (id == 4) ...[
          const Orderconfirmationpg()
        ] else if (id == 5) ...[
          AdminHome(),
        ] else if (id == 6)...[
          Orders()
        ],
        Positioned(
          bottom: -0.5.h,
          left: 1.w,
          right: 1.w,
          child: const Pg2BottonavBar(),
        )
      ]),
    );
  }
}
