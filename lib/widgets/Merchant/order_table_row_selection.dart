import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/merchantProvider/table_priority_provider.dart';
import 'package:provider/provider.dart';

void orderTableRowSelection(
    int index, BuildContext context, Function setTappedIndex) {
  if (index == 0) {
    context.read<TablePriorityProvider>().getOrders("ORDER_PLACED");
    setTappedIndex(index);
  } else if (index == 1) {
    context.read<TablePriorityProvider>().getOrders("ORDER_CONFIRMED");
    setTappedIndex(index);
  }
  // else if (index == 2) {
  //   context
  //       .read<TablePriorityProvider>()
  //       .getOrders(
  //           "ORDER_IN_PROGRESS");
  // }
  else if (index == 2) {
    context.read<TablePriorityProvider>().getOrders("ORDER_READY_FOR_PICKUP");
    setTappedIndex(index);
  } else if (index == 3) {
    context.read<TablePriorityProvider>().getOrders("ORDER_COMPLETED");
    setTappedIndex(index);
  } else if (index == 4) {
    context.read<TablePriorityProvider>().getOrders("ORDER_CANCELLED");
    setTappedIndex(index);
  }
  // setTappedIndex(index);
  // json = jsonDecode(json4);
}
