import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/order_history_provider.dart';
import 'package:inter_coffee/widgets/Admin/order_details_dialog.dart';
import 'package:provider/provider.dart';

void onRowSelectViewMore(map, BuildContext context, Function setLoader,
    Function setloaderfalse, bool isSelect) {
  setLoader();

  context
      .read<OrderHistory>()
      .getOrderhistory(context, map['orderId'])
      .then((value) => orderDetailsDialog(context, value))
      .whenComplete(() {
    setloaderfalse();
  });
}
