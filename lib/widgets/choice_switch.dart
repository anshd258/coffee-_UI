import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:inter_coffee/widgets/test_switch.dart';
import 'package:provider/provider.dart';
import '../models/order_prouct.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChoiceSwitch extends StatefulWidget {
  final List list;
  final String heading;
  const ChoiceSwitch({super.key, required this.list, required this.heading});

  @override
  State<ChoiceSwitch> createState() => _ChoiceSwitchState();
}

class _ChoiceSwitchState extends State<ChoiceSwitch> {
  String isSelected = "";
  Choice tempChoice = Choice();
  void setter(String data) {
    context.read<CartProductsProvider>().currentChoie.remove(tempChoice);
    isSelected = data;
    tempChoice.choice = [];
    tempChoice.choice!.add(data);
    context.read<CartProductsProvider>().choiceSetter(tempChoice);
    print(tempChoice.choice.toString());
  }

  @override
  void initState() {
    tempChoice.name = widget.heading;
    tempChoice.type = "Check_Box";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("working");
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 5.w / 0.7.h,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: widget.list.map((e) {
          return SwitchTest(
            e: e,
            setter: setter,
            isSelected: isSelected,
          );
        }).toList());
  }
}
