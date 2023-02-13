import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/order_prouct.dart';

class Pg3togglebutton extends StatefulWidget {
  final List<String> list;
  final String heading;

  const Pg3togglebutton({super.key, required this.list, required this.heading});

  @override
  State<Pg3togglebutton> createState() => _Pg3togglebuttonState();
}

class _Pg3togglebuttonState extends State<Pg3togglebutton> {
  //toggle button state
  String isSelected = "";
  Choice tempChoice = Choice();
  @override
  void initState() {
    isSelected = widget.list.first;
    tempChoice.name = widget.heading;
    tempChoice.type = "List";
    super.initState();
  }

  void setter(data) {
    context.read<CartProductsProvider>().currentChoie.remove(tempChoice);
    tempChoice.choice = [];
    tempChoice.choice!.add(data);
    context.read<CartProductsProvider>().choiceSetter(tempChoice);
  }

  @override
  Widget build(BuildContext context) {
    print(context.watch<CartProductsProvider>().cartData);
    List<String> mainList = widget.list;

    // void cartAssigner(String text, String value) {
    //   switch (text) {
    //     case "choiceOfCupFilling":
    //       Provider.of<CartProductsProvider>(context, listen: false)
    //           .updateChoiceOfCupFilling(value);
    //       break;

    //     case "choiceOfMilk":
    //       Provider.of<CartProductsProvider>(context, listen: false)
    //           .updateChoiceOfMilk(value);
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

    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: mainList.length,
    //   itemBuilder: (context, index) {
    //     String txt = mainList[index];
    //     return Container(
    //       // height: 3.h,
    //       // width: 17.w,
    //       padding: EdgeInsets.symmetric( horizontal: 0.5.w, vertical: 0.25.h ),
    //       margin: EdgeInsets.only( right: 2.5.w ),
    //       child: ElevatedButton(
    //         onPressed: () {
    //           setState(() {
    //            context.read<CartProductsProvider>().currentproduct;
    //            isSelected = txt;
    //           });
    //         },
    //         style: ElevatedButton.styleFrom(
    //             padding: EdgeInsets.all(0),
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(5)),
    //             backgroundColor:
    //                 isSelected == txt ? Colors.greenAccent.shade700 : Colors.white),
    //         child: Text(
    //           txt,
    //           style: GoogleFonts.inter(
    //               color: isSelected == txt ? Colors.white : Colors.black87,
    //               fontSize: 14.sp,
    //               fontWeight: FontWeight.w600),
    //         ),
    //       ),
    //     );
    //   },
    // );

    Color bgColor = Colors.white;
    Color txtColor = Colors.black87;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: mainList.map((e) {
        return GestureDetector(
          onTap: () {
            setter(e);

            setState(() {
              isSelected = e;
            });
          },
          child: Container(
            height: 4.h,
            padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.25.h),
            margin: EdgeInsets.only(right: 2.5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:
                  isSelected == e ? Colors.greenAccent.shade700 : Colors.white,
            ),
            child: Center(
              child: Text(
                e,
                style: GoogleFonts.inter(
                    color: isSelected == e ? Colors.white : Colors.black87,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      }).toList()),
    );
  }
}
