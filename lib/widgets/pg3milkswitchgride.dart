import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:inter_coffee/widgets/testswitch.dart';
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

String isSelected = "";

class _ChoiceSwitchState extends State<ChoiceSwitch> {
  Choice tempChoice = Choice();
  void setter(String data) {
    context.read<CartProductsProvider>().currentChoie.remove(tempChoice);
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
    isSelected = widget.list[0];
    // void cartAssigner(String text, String value) {
    //   switch (text) {
    //     case "choiceOfCupFilling":
    //       Provider.of<CartProductsProvider>(context, listen: false)
    //           .updateChoiceOfCupFilling(value);
    //       break;

    //     case "choiceOfMilk":
    //       context.read<CartProductsProvider>().updateChoiceOfMilk(value);
    //       break;

    //     case "choiceOfSugar":
    //       Provider.of<CartProductsProvider>(context, listen: false)
    //           .updateChoiceOfSugar(value);
    //       break;

    //     case "choiceOfSyrup":
    //       Provider.of<CartProductsProvider>(context, listen: false)
    //           .updateChoiceOfSyrup(value);
    //       break;

    //     case "eta":
    //       Provider.of<CartProductsProvider>(context, listen: false)
    //           .updateETA(value);
    //       break;
    //   }
    // }
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
          return SwitchTest(e: e, setter: setter);
        }).toList());
  }
}
