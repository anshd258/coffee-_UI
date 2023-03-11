import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/page/Admin/all_orders.dart';
import 'package:inter_coffee/page/Admin/merchant_home_screen.dart';
import 'package:inter_coffee/page/Admin/order_confirmed.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/page/Merchent/choice_filling_merchant.dart';
import 'package:inter_coffee/page/Merchent/create_order_merchant.dart';
import 'package:inter_coffee/page/Switcher.dart';
import 'package:inter_coffee/page/bottom_navbar.dart';
import 'package:inter_coffee/page/delivery_status.dart';
import 'package:inter_coffee/page/notification_screen.dart';
import 'package:inter_coffee/page/cart_screen.dart';
import 'package:inter_coffee/page/order_history_screen.dart';
import 'package:inter_coffee/page/otp_input_screen.dart';
import 'package:inter_coffee/page/login_screen.dart';
import 'package:inter_coffee/page/order_choice_filling_screen.dart';
import 'package:inter_coffee/page/profile_screen.dart';

String initialroute = switcher;

Map<String, Widget Function(BuildContext)> routes = {
  frontPage: (context) => const LoginScreen(),
  bottomNavBar: (context) => const BottomNavBar(),
  switcher: (context) => const Switcher(),
  orderChoiceFillingScreen: (context) => const OrderChoiceFillingScreen(),
  cartScreen: (context) => const CartScreen(),
  orderHistoryScreen: (context) => const OrderHistoryScreen(),
  otpInputScreen: (context) => const OtpInputScreen(),
  profileScreen: (context) => const ProfileScreen(),
  notificationScreen: (context) => const NotificationScreen(),
  deliveryStatus: (context) => const DeliveryStatus(),
  merchantHomeScreen: (context) => const MerchantHomeScreen(),
  allOrdersTable: (context) => const AllOrdersTable(),
  allOrders: (context) => const AllOrders(),
  createOrderMerchant: (context) => const CreateOrderMerchant(),
  choiceFillingMerchant: (context) => const ChoiceFillingMerchant(),
  merchantOrderConfirmed: (context) => const MerchantOrderConfirmed()
};
