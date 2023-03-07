import 'package:inter_coffee/provider/OrderHistoryProvider.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:inter_coffee/provider/merchantProvider/allOrderwithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/priorityOrderWithStatus.dart';
import 'package:inter_coffee/provider/merchantProvider/priorityordercount.dart';
import 'package:inter_coffee/provider/merchantProvider/tablePriorityProvider.dart';
import 'package:inter_coffee/provider/merchantProvider/tablewithstatusprovider.dart';
import 'package:inter_coffee/provider/merchantProvider/totalordercount.dart';
import 'package:inter_coffee/provider/notificationprovider.dart';
import 'package:inter_coffee/provider/orderStautsProvider.dart';
import 'package:inter_coffee/provider/productsprovider.dart';
import 'package:inter_coffee/provider/reportsProvider.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
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
];
