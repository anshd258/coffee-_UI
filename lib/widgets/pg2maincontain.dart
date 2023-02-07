import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/main.dart';
import 'package:provider/provider.dart';
import '../provider/productsprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
  void initState() {
    context.read<ProductsProvider>().getproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductsProvider>().productslist;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //namebar with name date delete icon and profie image
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            color: nameBar,
            child: const Center(child: name_bar2())),
        //for padding
        isAdmin
            ? GlassContainer.frostedGlass(
                height: 9.5.h,
                width: 100.w,
                borderColor: Colors.transparent,
                gradient: LinearGradient(
                    colors: searchBarBG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderWidth: 0.0,
                blur: isAdmin ? 15 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //textfield for searcching
                    TextField(
                      cursorColor: const Color.fromARGB(255, 182, 182, 182),
                      decoration: InputDecoration(
                          hintText: "Search favorite Beverages",
                          hintStyle: GoogleFonts.inter(
                            color: const Color.fromARGB(100, 182, 182, 182),
                            fontSize: 12,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune_rounded,
                            color: Color.fromARGB(255, 182, 182, 182),
                          ),
                          prefixIcon: const Icon(Icons.search,
                              color: Color.fromARGB(255, 182, 182, 182)),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          fillColor: Colors.white,
                          constraints: BoxConstraints(
                            maxWidth: 90.w,
                            maxHeight: 5.5.h,
                          )),
                    ),
                    //for gapping
                    // SizedBox(
                    //   height: 1.3.h,
                    // ),
                  ],
                ),
              )
            : SizedBox(
                height: 9.5.h,
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //textfield for searcching
                    TextField(
                      cursorColor: const Color.fromARGB(255, 182, 182, 182),
                      decoration: InputDecoration(
                          hintText: "Search favorite Beverages",
                          hintStyle: GoogleFonts.inter(
                            color: const Color.fromARGB(100, 182, 182, 182),
                            fontSize: 12,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune_rounded,
                            color: Color.fromARGB(255, 182, 182, 182),
                          ),
                          prefixIcon: const Icon(Icons.search,
                              color: Color.fromARGB(255, 182, 182, 182)),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          fillColor: Colors.white,
                          constraints: BoxConstraints(
                            maxWidth: 90.w,
                            maxHeight: 5.5.h,
                          )),
                    ),
                    //for gapping
                    // SizedBox(
                    //   height: 1.3.h,
                    // ),
                  ],
                ),
              ),
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
        isAdmin
            ? const SizedBox(
                height: 0,
                width: 0,
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   Get it instantly",
                  style: GoogleFonts.inter(
                    fontSize: 17.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: titleUserList,
                  ),
                ),
              ),
        //for padding
        SizedBox(
          height: 1.8.h,
        ),
        //lower sized box for the  verticallist of products
        Expanded(
          // decoration: BoxDecoration(
          //     color: Color.fromARGB(60, 0, 0, 0),
          //     borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          // margin: EdgeInsets.all(0),
          // width: 100.w,
          // height: 79.h,
          child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              // change the color here to change it to white
              // color: Color.fromARGB(60, 0, 0, 0),
              color: userListBG,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                isAdmin
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "   Get it instantly",
                          style: GoogleFonts.inter(
                            fontSize: 17.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: titleUserList,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: data.map((e) {
                        return PgLowerListCont(
                          e: e,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
