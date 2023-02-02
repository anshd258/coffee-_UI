import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/page/ProductList/product_list_all_details.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class Pg3togglebutton extends StatefulWidget {
  final List<String> list;
  const Pg3togglebutton({super.key, required this.list});

  @override
  State<Pg3togglebutton> createState() => _Pg3togglebuttonState();
}

class _Pg3togglebuttonState extends State<Pg3togglebutton> {
  //toggle button state
  
  @override
  Widget build(BuildContext context) {
    String isSelected = widget.list[0];
    List<String> mainList = widget.list;

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

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: mainList.map((e) {
          return Container(
            // height: 3.h,
            // width: 17.w,
            padding: EdgeInsets.symmetric( horizontal: 0.5.w, vertical: 0.25.h ),
            margin: EdgeInsets.only( right: 2.5.w ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                //  context.read<CartProductsProvider>().currentproduct;
                 isSelected = e;
                });
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor:
                      isSelected == e ? Colors.greenAccent.shade700 : Colors.white),
              child: Text(
                e,
                style: GoogleFonts.inter(
                    color: isSelected == e ? Colors.white : Colors.black87,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        }).toList()
      ),
    );

  }
}
