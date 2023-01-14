import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './page/page-2.dart';
import './page/page-1.dart';
import './page/orderspg.dart';
import './page/page-3.dart';
import './page/order-confirmation-pg.dart';
import './page/order_details_pg.dart';
import './page/otpinput.dart';
import './page/profilepg.dart';

void main() {
  runApp(const main_app());
}

class main_app extends StatefulWidget {
  const main_app({super.key});

  @override
  State<main_app> createState() => _main_appState();
}

class _main_appState extends State<main_app> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MaterialApp(
          initialRoute: "/",
          routes: {
            "/": (context) => const page_1(),
            "/page2": (context) => const page_2(),
            "/page3": (context) => const Page3(),
            "/orderconfirmPg": (context) => const Orderconfirmationpg(),
            "/orderdetailsPg": (context) => const OrderDetailspg(),
            "/orderspg": (context) => const OrderPg(),
            "/otpinput": (context) => const Otpscreen(),
            "/profile": (context) => const Profilepg()
          },
        );
      },
    );
  }
}
