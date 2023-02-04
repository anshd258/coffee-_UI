import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/page/ProductList/product_list_all_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';
import '../models/products_list_model.dart';

class Pg3BottomSheet extends StatefulWidget {
  final ProductList data;
  const Pg3BottomSheet({super.key, required this.data});

  @override
  State<Pg3BottomSheet> createState() => _Pg3BottomSheetState();
}

class _Pg3BottomSheetState extends State<Pg3BottomSheet> {
  //dropdown meenue state
  var dropdownvalue = 1;

  final choices = [
    Syrups(
        choice: ["Vanilla", "Chocolate", "Swaberry"],
        name: "syrup",
        type: "toggle")
  ];

  @override
  Widget build(BuildContext context) {
    final ProductList productsList =
        ModalRoute.of(context)?.settings.arguments as ProductList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //main glasscontainer
        GlassContainer.frostedGlass(
          height: 155.h,
          width: 100.w,
          blur: 20,
          frostedOpacity: 0.04,
          color: const Color.fromARGB(25, 189, 189, 189),
          borderColor: Colors.transparent,
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30), bottom: Radius.zero),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // for padding
              SizedBox(
                height: 3.h,
              ),

              // name rating row

              // for padding

              // name of  the product
              Container(
                width: 90.w,
                margin: EdgeInsets.only(bottom: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 55.w,
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productsList.name.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 21.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 205, 205, 205),
                            ),
                          ),
                          const Image(image: AssetImage("assets/6.png"))
                        ],
                      ),
                    ),
                    Container(
                      height: 3.h,
                      width: 12.w,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        value: dropdownvalue.toString(),
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, color: Colors.white38),
                        alignment: Alignment.center,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        iconEnabledColor:
                            const Color.fromARGB(255, 217, 217, 217),
                        focusColor: Colors.white30,
                        underline: const Text(""),
                        dropdownColor: Colors.black,
                        items: const [
                          DropdownMenuItem(
                            value: '1',
                            child: Text('1'),
                          ),
                          DropdownMenuItem(
                            value: '2',
                            child: Text('2'),
                          ),
                          DropdownMenuItem(
                            value: '3',
                            child: Text('3'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            context
                                    .read<CartProductsProvider>()
                                    .currentproduct
                                    .quantity =
                                value == null ? 1 : int.parse(value);
                            dropdownvalue = int.parse(value!);
                            quantity = value;
                          });
                        },
                      ),
                    ),

                    // forpadding

                    // dropdown button
                  ],
                ),
              ),
              // Container(
              //   width: 90.w,
              //   child: Row(
              //     children: [
              //       Text(
              //         widget.data.ratings!,
              //         style: GoogleFonts.inter(
              //           fontSize: 16.sp,
              //           color: Color.fromARGB(255, 197, 197, 197),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 3.w,
              //       ),
              //       Icon(
              //         Icons.star,
              //         color: Colors.amber.shade300,
              //         size: 16.sp,
              //       ),
              //       SizedBox(
              //         width: 1.w,
              //       ),
              //       Text(
              //         widget.data.numberOfReviews!,
              //         style: GoogleFonts.inter(
              //           fontSize: 16.sp,
              //           color: const Color.fromARGB(255, 197, 197, 197),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 5.w,
              //       ),
              //       Image(image: AssetImage("assets/6.png"))
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 90.w,
                child: Text(
                  productsList.description.toString(),
                  style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 197, 197, 197),
                      fontSize: 14.5.sp,
                      textStyle: const TextStyle(
                        wordSpacing: 1,
                      )),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 5.w,
              //     ),
              //     Text(
              //       "Choice of Cup Filling",
              //       style: GoogleFonts.inter(
              //         fontSize: 19.sp,
              //         fontWeight: FontWeight.w700,
              //         color: Color.fromARGB(255, 205, 205, 205),
              //       ),
              //     ),
              //   ],
              // ),
              // //for padding
              // SizedBox(
              //   height: 3.h,
              // ),
              // // toggle button widget
              // Pg3togglebutton(),
              // //for padding

              // Divider(
              //   color: Colors.white70,
              //   endIndent: 5.w,
              //   indent: 5.w,
              //   height: 4.h,
              // ),
              // // choice of milk text
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 5.w,
              //     ),
              //     Text(
              //       " Choice of Milk",
              //       style: GoogleFonts.inter(
              //         fontSize: 19.sp,
              //         fontWeight: FontWeight.w700,
              //         color: Color.fromARGB(255, 205, 205, 205),
              //       ),
              //     ),
              //   ],
              // ),
              // //milk choosing grid with switches
              // Container(
              //     height: 20.h,
              //     width: 90.w,
              //     alignment: Alignment.centerLeft,
              //     child: Pg3MilkSwitch()),
              // //for padding

              // Divider(
              //   color: Colors.white70,
              //   endIndent: 5.w,
              //   indent: 5.w,
              //   height: 4.h,
              // ),
              // Row(
              //   children: [
              //     //for padding
              //     SizedBox(
              //       width: 5.w,
              //     ),
              //     //choice of sugeer text
              //     Text(
              //       " Choice of Syrup",
              //       style: GoogleFonts.inter(
              //         fontSize: 19.sp,
              //         letterSpacing: 1,
              //         fontWeight: FontWeight.w700,
              //         color: Color.fromARGB(255, 205, 205, 205),
              //       ),
              //     ),
              //   ],
              // ),
              // //main type of suger selection switch
              // Container(
              //   height: 18.h,
              //   width: 90.w,
              //   alignment: Alignment.centerLeft,
              //   child: Pg3SugerGride(),
              // ),
              // Divider(
              //   color: Colors.white70,
              //   endIndent: 5.w,
              //   indent: 5.w,
              // ),
              // Row(
              //   children: [
              //     //for padding
              //     SizedBox(
              //       width: 5.w,
              //     ),
              //     //choice of sugeer text
              //     Container(
              //       margin: EdgeInsets.only(top: 1.h),
              //       child: Text(
              //         " Choice of Suger",
              //         style: GoogleFonts.inter(
              //           fontSize: 19.sp,
              //           letterSpacing: 1,
              //           fontWeight: FontWeight.w700,
              //           color: Color.fromARGB(255, 205, 205, 205),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Align(
              //   alignment: Alignment(-0.6, 0),
              //   child: Container(
              //     padding: EdgeInsets.only(top: 2.5.h),
              //     width: 60.w,
              //     child: DropdownButtonHideUnderline(
              //       child: DropdownButton2(
              //         items: items
              //             .map((e) => DropdownMenuItem<String>(
              //                   alignment: Alignment.centerLeft,
              //                   value: e.toString(),
              //                   child: Text(
              //                     e,
              //                     maxLines: 2,
              //                     style: GoogleFonts.inter(
              //                         color: const Color.fromARGB(
              //                             255, 197, 197, 197),
              //                         fontSize: 16.5.sp,
              //                         fontWeight: FontWeight.w300),
              //                   ),
              //                 ))
              //             .toList(),
              //         value: selecteditem,
              //         icon: Container(
              //           height: 5.h,
              //           width: 10.w,
              //           decoration: BoxDecoration(
              //               color: Colors.black54,
              //               borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(0),
              //                   bottomLeft: Radius.circular(0),
              //                   bottomRight: Radius.circular(4),
              //                   topRight: Radius.circular(4))),
              //           child: const Icon(
              //             Icons.arrow_drop_down,
              //           ),
              //         ),
              //         iconSize: 25.sp,
              //         iconOnClick: Container(
              //           height: 5.h,
              //           width: 10.w,
              //           decoration: BoxDecoration(
              //               color: Colors.black54,
              //               borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(0),
              //                   bottomLeft: Radius.circular(0),
              //                   bottomRight: Radius.circular(4),
              //                   topRight: Radius.circular(4))),
              //           child: const Icon(Icons.arrow_drop_up),
              //         ),
              //         iconEnabledColor: Colors.white,
              //         iconDisabledColor: Colors.grey,
              //         buttonHeight: 5.5.h,
              //         buttonWidth: 50.w,
              //         buttonPadding: EdgeInsets.only(left: 5.w, right: 0.3.w),
              //         buttonDecoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(4),
              //           border: Border.all(
              //             color: Colors.grey.shade700,
              //           ),
              //           color: Colors.grey.shade700,
              //         ),
              //         buttonElevation: 2,
              //         itemHeight: 5.h,
              //         itemPadding: EdgeInsets.only(left: 4.w, right: 4.w),
              //         dropdownMaxHeight: 50.w,
              //         dropdownWidth: 50.w,
              //         dropdownPadding: null,
              //         dropdownDecoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(4),
              //           color: Colors.black54,
              //         ),
              //         dropdownElevation: 8,
              //         scrollbarRadius: const Radius.circular(40),
              //         scrollbarThickness: 6,
              //         scrollbarAlwaysShow: true,
              //         offset: const Offset(0, 0),
              //         onChanged: (value) {
              //           setState(() {
              //             selecteditem = value as String;
              //           });
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              // Divider(
              //   color: Colors.white70,
              //   endIndent: 5.w,
              //   indent: 5.w,
              //   height: 4.h,
              // ),
              // Row(
              //   children: [
              //     //for padding
              //     SizedBox(
              //       width: 5.w,
              //     ),
              //     //choice of sugeer text
              //     Text(
              //       " ETA",
              //       style: GoogleFonts.inter(
              //         fontSize: 19.sp,
              //         letterSpacing: 1,
              //         fontWeight: FontWeight.w700,
              //         color: Color.fromARGB(255, 205, 205, 205),
              //       ),
              //     ),
              //   ],
              // ),
              // //main type of suger selection switch
              // Container(
              //   height: 18.h,
              //   width: 90.w,
              //   alignment: Alignment.centerLeft,
              //   child: ETAgridpg3(),
              // ),
              // ListView.builder(
              //   itemBuilder: (context, index) {
              //     return productsList.entries.map( (e) {
              //     return Container();
              //   });
              //   },
              // ),
              // ListView.builder(
              //   itemCount: productsList.keys.last.length,
              //   itemBuilder: (context, index) {
              //     String txt = productsList.keys.elementAt(index).toString();
              //     return Column(
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 5.w),
              //           child: Text(
              //             txt,
              //             style: GoogleFonts.inter(
              //               fontSize: 19.sp,
              //               letterSpacing: 1,
              //               fontWeight: FontWeight.w700,
              //               color: const Color.fromARGB(255, 205, 205, 205),
              //             ),
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // ),
              ...choices.map((e){return Container(
                
              );}).toList(),
          
              Expanded(
                child: AllProductPropertiesRender(productList: productsList),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
