import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  @override
  void initState() {
    isSelected = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> mainList = widget.list;

    void cartAssigner(String text, String value) {
      switch (text) {
        case "choiceOfCupFilling":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfCupFilling(value);
          break;

        case "choiceOfMilk":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfMilk(value);
          break;

        case "choiceOfSugar":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfSugar(value);
          break;

        case "choiceOfSyrup":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateChoiceOfSyrup(value);
          break;

        case "eta":
          Provider.of<CartProductsProvider>(context, listen: false)
              .updateETA(value);
          break;
      }
    }

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
            print(e);
            print(isSelected);
            setState(() {
              isSelected = e;
              cartAssigner(widget.heading, e);
              print("this is choice of Cup filling -> ${context
                  .read<CartProductsProvider>()
                  .currentproduct
                  .choiceOfCupFilling}");
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
