import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/models/products_list_model.dart';
import 'package:inter_coffee/widgets/ProductList/drop_down_list.dart';
import 'package:inter_coffee/widgets/choice_switch.dart';
import 'package:inter_coffee/widgets/toggle_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductPropertiesRender extends StatefulWidget {
  final List<Syrups>? choices;
  const AllProductPropertiesRender({super.key, required this.choices});

  @override
  State<AllProductPropertiesRender> createState() =>
      _AllProductPropertiesRenderState();
}

List<String> ansList = [];
String id = "";
String name = "";
String ratings = "";
String numberOfReviews = "";
String discription = "";
String imageUrl = "";
String price = "";
String quantity = "";
String choiceOfCupFilling = "";
String choiceOfMilk = "";
String choiceOfSuger = "";

class _AllProductPropertiesRenderState
    extends State<AllProductPropertiesRender> {
  String selecteditem = "";
  String heading = "";

  Widget typeClassifier(String type) {
    switch (type) {
      case "Check_Box":
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ChoiceSwitch(list: ansList, heading: heading),
        );

      case "Drop_Down":
        return DropDownSelection(list: ansList, heading: heading);

      case "List":
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
            child: ToggleButton(list: ansList, heading: heading));
    }

    return const SizedBox();
  }

  void headingSelector(String text) {
    switch (text) {
      case "Choice of Cup Filling":
        heading = "choiceOfCupFilling";
        break;

      case " Choice of Milk":
        heading = "choiceOfMilk";
        break;

      case "Choice of Sugar":
        heading = "choiceOfSugar";
        break;

      case "Choice of Syrup":
        heading = "choiceOfSyrup";
        break;
      case "ETA":
        heading = "eta";
        break;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    // Map<String, Object> productsList = widget.productList as Map<String, Object>;

    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: selection.entries.map((e) {
        //   String txt = e.key.toString();
        //   int cap = txt.lastIndexOf("_");
        //   if (cap > -1) {
        //     txt =
        //         txt.replaceRange(cap, cap + 2, " ${txt[cap + 1].toUpperCase()}");
        //   }
        //   heading = txt;
      
        //   Map<String, dynamic> detailsOfSelection = e.value;
        //   List<String> list =
        //       detailsOfSelection.values.elementAt(1) as List<String>;
        //   ansList = list;
        //   selecteditem = list[0];
      
        //   String type = detailsOfSelection.values.elementAt(0).toString();
      
        //   return Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 5.w),
        //         child: Text(
        //           "Choice of ${txt.replaceFirst(txt[0], txt[0].toUpperCase())}",
        //           style: GoogleFonts.inter(
        //             fontSize: 19.sp,
        //             letterSpacing: 1,
        //             fontWeight: FontWeight.w700,
        //             color: const Color.fromARGB(255, 205, 205, 205),
        //           ),
        //         ),
        //       ),
        //       typeClassifier(type),
        //     ],
        //   );
        // }).toList(),
        children: widget.choices != null
            ? widget.choices!.map((e) {
                String txt = e.name.toString();
                int cap = txt.lastIndexOf("_");
                if (cap > -1) {
                  txt = txt.replaceRange(
                      cap, cap + 2, " ${txt[cap + 1].toUpperCase()}");
                }
                print("this is text -> $txt");
                headingSelector(txt);
                print("this is heading -> $heading");
      
                List<String> list = e.choice!.cast<String>();
                ansList = list;
                selecteditem = list[0];
      
                String type = e.type.toString();
      
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                      child: Text(
                        txt.replaceFirst(txt[0], txt[0].toUpperCase()),
                        style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 205, 205, 205),
                        ),
                      ),
                    ),
                    typeClassifier(type),
                    Divider(
                      color: Colors.white70,
                      endIndent: 5.w,
                      indent: 5.w,
                      height: 2.5.h,
                    ),
                  ],
                );
              }).toList()
            : [],
      ),
    );
  }
}
