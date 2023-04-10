import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/merchantProvider/table_priority_provider.dart';
import 'package:inter_coffee/widgets/Admin/confirmation_dialog.dart';
import 'package:inter_coffee/widgets/Admin/order_eta_dialog.dart';
import 'package:provider/provider.dart';

void orderStateMethod(
    map,
    BuildContext context,
    Function setLoader,
    Function setloaderfalse,
    bool isSelected,
    String id,
    Function setid,
    int tappedIndex,
    Function setIdNull) {
  if (tappedIndex == 0) {
    setLoader();
    orderETADialog(context, map['orderId'], 'priority',map['orderNo']).then((value) {
      context.read<TablePriorityProvider>().getOrders("ORDER_PLACED");
      setloaderfalse();
    });
  }
  // else if (tappedIndex == 1) {
  //   confirmationDialog(
  //       context,
  //       "Put Order In Processing",
  //       "ORDER_IN_PROGRESS",
  //       id,
  //       "ORDER_CONFIRMED",
  //       'priority');
  // }
  else if (tappedIndex == 1) {
    setLoader();
    confirmationDialog(context, "Is The Order Brewed", "ORDER_READY_FOR_PICKUP",
            map['orderId'], "ORDER_CONFIRMED", "priority")
        .then((value) {
      context.read<TablePriorityProvider>().getOrders("ORDER_CONFIRMED");
      setloaderfalse();
    });
  } else if (tappedIndex == 2) {
    setLoader();
    confirmationDialog(context, "Is The Order Delivered? ", "ORDER_COMPLETED",
            map['orderId'], "ORDER_READY_FOR_PICKUP", "priority")
        .then((value) {
      context.read<TablePriorityProvider>().getOrders("ORDER_READY_FOR_PICKUP");
      setloaderfalse();
    });
  }
}
