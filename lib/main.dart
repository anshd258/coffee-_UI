import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inter_coffee/page/Admin/order_confirmed.dart';
import 'package:inter_coffee/page/Admin/orders.dart';
import 'package:inter_coffee/provider/merchantProvider/allOrderwithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/priorityOrderWithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/priorityordercount.dart';
import 'package:inter_coffee/provider/merchantProvider/tablePriorityProvider.dart';
import 'package:inter_coffee/provider/merchantProvider/tablewithstatusprovider.dart';
import 'package:inter_coffee/provider/merchantProvider/totalordercount.dart';
import 'package:inter_coffee/provider/reportsProvider.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:inter_coffee/provider/orderStautsProvider.dart';
import './provider/notificationprovider.dart';
import 'package:provider/provider.dart';
import './provider/router.dart';
import './provider/OrderHistoryProvider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './page/bottombartoggle.dart';
import './page/page-1.dart';
import './provider/loginAuthProvider.dart';
import './page/orderspg.dart';
import './page/Switcher.dart';
import './page/delivery_status.dart';
import './page/page-3.dart';
import './page/order-confirmation-pg.dart';
import './page/order_details_pg.dart';
import './page/otpinput.dart';
import './page/profilepg.dart';
import './provider/productsprovider.dart';
import './provider/cartProductProvider.dart';
import './page/notificationpg.dart';
import './page/Admin/homepage.dart';
import './page/Admin/allOrders.dart';
import './page/Admin/account.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

// ...
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print(
      "Handling a background message: ${message.notification!.android!.priority}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print(
        'Message data: ${message.notification!.android!.priority.toString()}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  }).onError((eror) => print("error on forground ${eror}"));
  runApp(const MainApp());
}

bool isAdmin = false;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AllOrderProvider>(
            create: (context) => AllOrderProvider(),
          ),
          ChangeNotifierProvider<PriorityOrderProvider>(
            create: (context) => PriorityOrderProvider(),
          ),
          ChangeNotifierProvider<PriorityOrderCount>(
            create: (context) => PriorityOrderCount(),
          ),
          ChangeNotifierProvider<TotalOrderCount>(
            create: (context) => TotalOrderCount(),
          ),
          ChangeNotifierProvider<OrderHistory>(
            create: (context) => OrderHistory(),
          ),
          ChangeNotifierProvider<TableWithStatusProvider>(
            create: (context) => TableWithStatusProvider(),
          ),
          ChangeNotifierProvider<routing>(
            create: (context) => routing(),
          ),
          ChangeNotifierProvider<ReportsProvider>(
            create: (context) => ReportsProvider(),
          ),
          ChangeNotifierProvider<ProductsProvider>(
            create: (context) => ProductsProvider(),
          ),
          ChangeNotifierProvider<TablePriorityProvider>(
            create: (context) => TablePriorityProvider(),
          ),
          ChangeNotifierProvider<CartProductsProvider>(
            create: (context) => CartProductsProvider(),
          ),
          ChangeNotifierProvider<userDetailsProvider>(
            create: (context) => userDetailsProvider(),
          ),
          ChangeNotifierProvider<NotificationProvider>(
            create: (context) => NotificationProvider(),
          ),
          ChangeNotifierProvider<LoginAuthProvider>(
            create: (context) => LoginAuthProvider(),
          ),
          ChangeNotifierProvider<MyData>(
            create: (context) => MyData(),
          )
        ],
        child: ResponsiveSizer(
          builder: (p0, p1, p2) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: "/switcher",
              routes: {
                "/": (context) => const page_1(),
                "/page2": (context) => const Toggle(),
                "/switcher": (context) => const Switcher(),
                "/page3": (context) => const Page3(),
                "/orderconfirmPg": (context) => const Orderconfirmationpg(),
                "/orderdetailsPg": (context) => const OrderDetailspg(),
                "/orderspg": (context) => const OrderPg(),
                "/otpinput": (context) => const Otpscreen(),
                "/profile": (context) => const Profilepg(),
                "/notifications": (context) => const NotificationPg(),
                "/deliveryStatus": (context) => const OrderStatus(),
                "/AdminHome": (context) => const AdminHome(),
                "/OrdersAdmin": (context) => const Orders(),
                "/AdminAccount": (context) => const AccountAdmin(),
                "/AllOrders": (context) => const AllOrders(),
                "/OrderConfirmed": (context) => const OrderConfirmed()
              },
            );
          },
        ));
  }
}
