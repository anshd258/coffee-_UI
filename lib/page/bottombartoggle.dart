import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './page-2.dart';
import './profilepg.dart';
import './order-confirmation-pg.dart';
import '../widgets/PG2bottomnavbar.dart';
import 'package:provider/provider.dart';
import '../provider/router.dart';
import './orderspg.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    final id = context.watch<routing>().gettingroute;
    return Container(
      height: 100.h,
      width: 100.w,
      child: Stack(children: [
        if (id == 1) ...[
          page_2()
        ] else if (id == 2) ...[
          Profilepg()
        ] else if (id == 3) ...[
          OrderPg()
        ] else if (id == 4) ...[
          Orderconfirmationpg()
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
