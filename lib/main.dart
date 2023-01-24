import 'package:flutter/material.dart';
import 'package:inter_coffee/page/Admin/order_confirmed.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import './provider/notificationprovider.dart';
import 'package:provider/provider.dart';
import './provider/router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './page/bottombartoggle.dart';
import './page/page-1.dart';
import './page/orderspg.dart';
import './page/page-3.dart';
import './page/order-confirmation-pg.dart';
import './page/order_details_pg.dart';
import './page/otpinput.dart';
import './page/profilepg.dart';
import './provider/productsprovider.dart';
import './provider/cartProductProvider.dart';
import './page/notificationpg.dart';
import './page/Admin/homepage.dart';
import './page/Admin/account.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<routing>(
            create: (context) => routing(),
          ),
          ChangeNotifierProvider<ProductsProvider>(
            create: (context) => ProductsProvider(),
          ),
          ChangeNotifierProvider<CartProductsProvider>(
            create: (context) => CartProductsProvider(),
          ),
          ChangeNotifierProvider<NotificationProvider>(
            create: (context) => NotificationProvider(),
          )
        ],
        child: ResponsiveSizer(
          builder: (p0, p1, p2) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: "/AdminHome",
              routes: {
                "/": (context) => const page_1(),
                "/page2": (context) => const Toggle(),
                "/page3": (context) => const Page3(),
                "/orderconfirmPg": (context) => const Orderconfirmationpg(),
                "/orderdetailsPg": (context) => const OrderDetailspg(),
                "/orderspg": (context) => const OrderPg(),
                "/otpinput": (context) => const Otpscreen(),
                "/profile": (context) => const Profilepg(),
                "/notifications": (context) => const NotificationPg(),
                "/AdminHome": (context) => const AdminHome(),
                "/OrdersAdmin": (context) => const Orders(),
                "/AdminAccount": (context) => const AccountAdmin(),
                "/OrderConfirmed": (context) => const OrderConfirmed()
              },
            );
          },
        ));
  }
}
