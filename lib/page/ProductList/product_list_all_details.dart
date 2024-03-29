import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/models/products_list_model.dart';
import 'package:inter_coffee/widgets/ProductList/drop_down_list.dart';
import 'package:inter_coffee/widgets/pg3milkswitchgride.dart';
import 'package:inter_coffee/widgets/pg3togglebutton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductPropertiesRender extends StatefulWidget {
  final List<Map<String, Object>> choices;
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
          child: ChoiceSwitch(
            list: ansList,
          ),
        );

      case "Drop_Down":
        return DropDownSelection(list: ansList);

      case "List":
        return Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
            child: Pg3togglebutton(
              list: ansList,
            ));
    }

    if (heading == "Cup Filling") {
      choiceOfCupFilling = isSelected.isNotEmpty ? isSelected : "";
    } else if (heading == "Milk Categories") {
      choiceOfMilk = isSelected.isNotEmpty ? isSelected : "";
    } else if (heading == "Sugar Levels") {
      choiceOfSuger = isSelected.isNotEmpty ? isSelected : "";
    }
    print(isSelected);

    return const SizedBox();
  }

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
        children: widget.choices.map((e) {
          Syrups objectOfList = Syrups(
            name: e['name'].toString(),
            type: e['type'].toString(),
            choice: e['choice'] as List<dynamic>,
          );

          String txt = objectOfList.name.toString();
          int cap = txt.lastIndexOf("_");
          if (cap > -1) {
            txt = txt.replaceRange(
                cap, cap + 2, " ${txt[cap + 1].toUpperCase()}");
          }
          heading = txt;

          List<String> list = objectOfList.choice!.cast<String>();
          ansList = list;
          selecteditem = list[0];

          String type = objectOfList.type.toString();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Text(
                  "Choice of ${txt.replaceFirst(txt[0], txt[0].toUpperCase())}",
                  style: GoogleFonts.inter(
                    fontSize: 19.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 205, 205, 205),
                  ),
                ),
              ),
              typeClassifier(type),
            ],
          );
        }).toList(),
      ),
    );
  }
}
