import 'package:inter_coffee/provider/merchantProvider/set_cafe_timings.dart';
import 'package:inter_coffee/provider/order_history_provider.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/all_order_with_status.dart';
import 'package:inter_coffee/provider/merchantProvider/priority_order_with_status.dart';
import 'package:inter_coffee/provider/merchantProvider/priority_order_count.dart';
import 'package:inter_coffee/provider/merchantProvider/table_priority_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/table_with_status_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/total_order_count.dart';
import 'package:inter_coffee/provider/notification_provider.dart';
import 'package:inter_coffee/provider/order_stauts_provider.dart';
import 'package:inter_coffee/provider/products_provider.dart';
import 'package:inter_coffee/provider/reports_provider.dart';
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
  ),
  ChangeNotifierProvider<SetCafeTimings>(
    create: (context) => SetCafeTimings(),
  )
];
