import 'package:flutter/material.dart';
import 'package:inter_coffee/page/Admin/account.dart';
import 'package:inter_coffee/page/Admin/allOrders.dart';
import 'package:inter_coffee/page/Admin/homepage.dart';
import 'package:inter_coffee/page/Admin/order_confirmed.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/page/Merchent/choice_filling_merchant.dart';
import 'package:inter_coffee/page/Merchent/create_order_merchant.dart';
import 'package:inter_coffee/page/Switcher.dart';
import 'package:inter_coffee/page/bottombartoggle.dart';
import 'package:inter_coffee/page/delivery_status.dart';
import 'package:inter_coffee/page/notificationpg.dart';
import 'package:inter_coffee/page/order-confirmation-pg.dart';
import 'package:inter_coffee/page/order_details_pg.dart';
import 'package:inter_coffee/page/orderspg.dart';
import 'package:inter_coffee/page/otpinput.dart';
import 'package:inter_coffee/page/page-1.dart';
import 'package:inter_coffee/page/page-3.dart';
import 'package:inter_coffee/page/profilepg.dart';

String initialroute = "/switcher";

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const page_1(),
  "/page2": (context) => const Toggle(),
  "/switcher": (context) => Switcher(),
  "/page3": (context) => const Page3(),
  "/orderconfirmPg": (context) => const Orderconfirmationpg(), //?  can be removed 
  "/orderdetailsPg": (context) => const OrderDetailspg(),    //? can be removed
  "/orderspg": (context) => const OrderPg(),
  "/otpinput": (context) => const Otpscreen(),
  "/profile": (context) => const Profilepg(),
  "/notifications": (context) => const NotificationPg(), // ?can be removed
  "/deliveryStatus": (context) => const OrderStatus(),
  "/AdminHome": (context) => const AdminHome(), //?can be removed
  "/OrdersAdmin": (context) => const Orders(),  //?can be removed
  "/AllOrders": (context) => const AllOrders(),
  "/CreateOrderMerchant": (context) => const CreateOrderMerchant(),
  "/ChoiceFillingMerchant": (context) => const ChoiceFillingMerchant(),
  "/OrderConfirmed": (context) => const OrderConfirmed()
};
