import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/ProductList/drop_down_list.dart';
import 'package:inter_coffee/widgets/pg3milkswitchgride.dart';
import 'package:inter_coffee/widgets/pg3togglebutton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductPropertiesRender extends StatefulWidget {
  const AllProductPropertiesRender({super.key});

  @override
  State<AllProductPropertiesRender> createState() =>
      _AllProductPropertiesRenderState();
}

List<String> ansList = [];

class _AllProductPropertiesRenderState
    extends State<AllProductPropertiesRender> {
  String selecteditem = "";

  final productsList = {
    "id": "1f60879f-3482-45c9-a5e9-5ea30253e2cd",
    "name": "Cold Coffee",
    "img": "Good Link of Img",
    "description":
        "This is a delicious coffee  made with Latte Machine & ancient coffee from Chikmangaluru",
    "choice": {
      "syrups": {
        "type": "Check_Box",
        "choice": ["Vanilla", "Chocolate", "Swaberry"]
      },
      "cup_filling": {
        "type": "List",
        "choice": ["Full", "Half", "Quarter"]
      },
      "sugar_levels": {
        "type": "Drop_Down",
        "choice": ["Full XI", "Half XII", "Quater XIIII"]
      },
      "milk_categories": {
        "type": "Check_Box",
        "choice": ["Skim Cream", "Full Cream", "HomoGenies Milk"]
      }
    }
  };

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
        return DropDownSelection( list: ansList );

      case "List":
        return Container(
          padding: EdgeInsets.symmetric( vertical: 1.h, horizontal: 5.w ),
          child: Pg3togglebutton(
            list: ansList,
          )
        );
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, Object>> selection =
        productsList.entries.last.value as Map<String, Map<String, Object>>;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selection.length,
      itemBuilder: (context, index) {
        String txt = selection.keys.elementAt(index);
        int cap = txt.lastIndexOf("_");
        if (cap > -1) {
          txt =
              txt.replaceRange(cap, cap + 2, " ${txt[cap + 1].toUpperCase()}");
        }

        Map<String, Object> detailsOfSelection =
            selection.values.elementAt(index);
        List<String> list =
            detailsOfSelection.values.elementAt(1) as List<String>;
        ansList = list;
        selecteditem = list[0];

        String type = detailsOfSelection.values.elementAt(0).toString();

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
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
          ),
        );
      },
    );
  }
}
