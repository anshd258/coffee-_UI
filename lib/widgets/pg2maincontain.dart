import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/productsprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductsProvider>().products;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //for gapping

        //namebar with name date delete icon and profie image
        name_bar2(),
        //for padding
        SizedBox(
          height: 2.h,
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
                maxHeight: 5.5.h,
              )),
        ),
        //for gapping
        SizedBox(
          height: 1.3.h,
        ),
        // mid container fir the horizontal list of products
        // Container(
        //   width: 100.w,
        //   height: 35.h,
        //   color: Colors.black26,
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 2.h,
        //       ),

        //       //row containinf inner contents
        //       Row(
        //         children: [
        //           SizedBox(
        //             width: 7.w,
        //           ),
        //           //most popularbeverage text
        //           Text(
        //             "Most Popular Beverages",
        //             style: GoogleFonts.inter(
        //               fontSize: 14,
        //               letterSpacing: 1,
        //               fontWeight: FontWeight.w300,
        //               color: Color.fromARGB(255, 205, 205, 205),
        //             ),
        //           ),
        //         ],
        //       ),
        //       //padding
        //       SizedBox(
        //         height: 2.h,
        //       ),
        //       //single child scroll view for making row scrollable
        //       SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Row(
        //           children: productsInfo.map((e) {
        //             print(e["image"]);
        //             //page row content widget
        //             return Pg2MidRowCont(e: e);
        //           }).toList(),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // //some more padding
        // SizedBox(height: 2.h),
        //bottom get it instently text
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "   Get it instantly",
            style: GoogleFonts.inter(
              fontSize: 17.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 205, 205, 205),
            ),
          ),
        ),
        //for padding
        SizedBox(
          height: 1.8.h,
        ),
        //lower sized box for the  verticallist of products
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(60, 0, 0, 0),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          margin: EdgeInsets.all(0),
          width: 100.w,
          height: 79.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: data!.map((e) {
                return PgLowerListCont(
                  e: e,
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
