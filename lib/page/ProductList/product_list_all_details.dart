import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/pg3milkswitchgride.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductPropertiesRender extends StatefulWidget {
  const AllProductPropertiesRender({super.key});

  @override
  State<AllProductPropertiesRender> createState() => _AllProductPropertiesRenderState();
}

class _AllProductPropertiesRenderState extends State<AllProductPropertiesRender> {
  List<String> ansList = [];
  String selecteditem = "";
  @override
  void initState() {
    super.initState();
    selecteditem = "";
  }
  @override
  void dispose() {
    super.dispose();
    selecteditem;
  }
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
        "type": "Check_Box",
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
  
  Widget typeClassifier( String type ) {
    switch( type ) {
      case "Check_Box":
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ChoiceSwitch(
            list: ansList ,
          ),
        );
        
      case "Drop_Down":
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
          width: 60.w,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: ansList
                  .map((e) => DropdownMenuItem<String>(
                        alignment: Alignment.centerLeft,
                        value: e.toString(),
                        child: Text(
                          e,
                          maxLines: 2,
                          style: GoogleFonts.inter(
                              color: const Color.fromARGB(
                                  255, 197, 197, 197),
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w300),
                        ),
                      ))
                  .toList(),
              value: selecteditem,
              icon: Container(
                height: 5.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(4),
                        topRight: Radius.circular(4))),
                child: const Icon(
                  Icons.arrow_drop_down,
                ),
              ),
              iconSize: 25.sp,
              iconOnClick: Container(
                height: 5.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(4),
                        topRight: Radius.circular(4))),
                child: const Icon(Icons.arrow_drop_up),
              ),
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
              buttonHeight: 5.5.h,
              buttonWidth: 50.w,
              buttonPadding: EdgeInsets.only(left: 5.w, right: 0.3.w),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey.shade700,
                ),
                color: Colors.grey.shade700,
              ),
              buttonElevation: 2,
              itemHeight: 5.h,
              itemPadding: EdgeInsets.only(left: 4.w, right: 4.w),
              dropdownMaxHeight: 50.w,
              dropdownWidth: 50.w,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black54,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
              onChanged: (value) {
                selecteditem = value.toString();
                setState(() {
                  selecteditem = value as String;
                });
              },
            ),
          ),
        );

      case "List":
        return const SizedBox();
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    Map<String,  Map<String, Object>> selection = productsList.entries.last.value as Map<String,  Map<String, Object>>;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selection.length,
      itemBuilder: (context, index) {
        String txt = selection.keys.elementAt(index);
        int cap = txt.lastIndexOf("_");
        if( cap > -1 ) {
          txt = txt.replaceRange( cap, cap+2, " ${txt[cap+1].toUpperCase()}");
        }

        Map<String, Object> detailsOfSelection = selection.values.elementAt(index);
        List<String> list = detailsOfSelection.values.elementAt(1) as List<String>;
        ansList = list;
        selecteditem = list[0];

        String type = detailsOfSelection.values.elementAt(0).toString();

        return Column(
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
            typeClassifier( type ),
          ],
        );
      },
    );
  }
}