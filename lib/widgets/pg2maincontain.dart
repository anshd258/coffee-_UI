import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../widgets/pg2-mid-row-cont.dart';
import 'namebar2.dart';
import '../widgets/Pg2-lower-list-cont.dart';

class PG2maincont extends StatefulWidget {
  const PG2maincont({super.key});

  @override
  State<PG2maincont> createState() => _PG2maincontState();
}

class _PG2maincontState extends State<PG2maincont> {
  //data of the products offerd
  List productsInfo = [
    {
      "name": "Hot Cappuccino",
      "rating": "4.9",
      "noreviews": "(456)",
      "image": "assets/3.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
    {
      "name": "Lattè",
      "rating": "4.5",
      "noreviews": "(896)",
      "image": "assets/2.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
    {
      "name": "Flate White",
      "rating": "4.9",
      "noreviews": "(626)",
      "image": "assets/4.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //for gapping
        SizedBox(
          height: 8.h,
        ),
        //namebar with name date delete icon and profie image
        name_bar2(),
        //for padding
        SizedBox(
          height: 1.h,
        ),
        //textfield for searcching
        TextField(
          cursorColor: Color.fromARGB(255, 182, 182, 182),
          decoration: InputDecoration(
              hintText: "Search favorite Beverages",
              hintStyle: GoogleFonts.inter(
                color: Color.fromARGB(100, 182, 182, 182),
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.tune_rounded,
                color: Color.fromARGB(255, 182, 182, 182),
              ),
              prefixIcon:
                  Icon(Icons.search, color: Color.fromARGB(255, 182, 182, 182)),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
              fillColor: Colors.white,
              constraints: BoxConstraints(
                maxWidth: 90.w,
                maxHeight: 5.h,
              )),
        ),
        //for gapping
        SizedBox(
          height: 3.h,
        ),
        // mid container fir the horizontal list of products
        Container(
          width: 100.w,
          height: 35.h,
          color: Colors.black26,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),

              //row containinf inner contents
              Row(
                children: [
                  SizedBox(
                    width: 7.w,
                  ),
                  //most popularbeverage text
                  Text(
                    "Most Popular Beverages",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                  ),
                ],
              ),
              //padding
              SizedBox(
                height: 2.h,
              ),
              //single child scroll view for making row scrollable
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productsInfo.map((e) {
                    print(e["image"]);
                    //page row content widget
                    return Pg2MidRowCont(e: e);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        //some more padding
        SizedBox(height: 2.h),
        //bottom get it instently text
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "   Get it instantly",
            style: GoogleFonts.inter(
              fontSize: 15,
              letterSpacing: 1,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 205, 205, 205),
            ),
          ),
        ),
        //for padding
        SizedBox(
          height: 0.5.h,
        ),
        //lower sized box for the  verticallist of products
        SizedBox(
          height: 35.5.h,
          child: SingleChildScrollView(
            child: Column(
              children: productsInfo.map((e) {
                return PgLowerListCont(e: e);
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
