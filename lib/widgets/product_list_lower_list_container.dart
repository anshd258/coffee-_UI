import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/products_list_model.dart';

class ProductListScreenLowerListContainer extends StatefulWidget {
  final ProductList e;
  const ProductListScreenLowerListContainer({super.key, required this.e});

  @override
  State<ProductListScreenLowerListContainer> createState() =>
      _ProductListScreenLowerListContainerState();
}

class _ProductListScreenLowerListContainerState
    extends State<ProductListScreenLowerListContainer> {
  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> imageChecker() {
      // print(widget.e.img);
      // if (widget.e.img == "coffee-1.jpeg") widget.e.img = "assets/7.jpg";
      // print(widget.e.img);
      if (widget.e.img != null) {
        return NetworkImage(widget.e.img!);
      }
      return const AssetImage('assets/7.jpg');
    }

    return Column(
      children: [
        //for padding
        SizedBox(
          height: 2.h,
        ),
        // for detecting clicks and directing them to next page-3
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(orderChoiceFillingScreen, arguments: widget.e);
          },
          child: GlassContainer.frostedGlass(
            height: 17.h,
            width: 90.w,
            blur: 17,
            frostedOpacity: 0.04,
            color: Theme.of(context).cardColor,
            // color: Color.fromARGB(70, 255, 255, 255),
            elevation: 10,
            borderColor: Colors.white10,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //for padding
                SizedBox(
                  width: 5.w,
                ),
                //main container with discription, rating etc.
                Container(
                  alignment: Alignment.centerLeft,
                  height: 15.h,
                  width: 53.w,
                  child: Column(
                    children: [
                      //name of the product
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0.5.h),
                          width: 40.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.e.name!,
                                style: GoogleFonts.inter(
                                  fontSize: 17.5.sp,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: titleUserList,
                                ),
                              ),
                              const Image(image: AssetImage("assets/6.png"))
                            ],
                          ),
                        ),
                      ),
                      //pading

                      //inner row
                      //padding between inner row and discription

                      //discription text
                      Container(
                        child: Text(
                          widget.e.description == null
                              ? "No Available Description"
                              : widget.e.description!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              color: Theme.of(context).hintColor,
                              // color: Color.fromARGB(160, 255, 255, 255),
                              fontSize: 13.sp,
                              textStyle: const TextStyle(
                                wordSpacing: 1,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                //for padding
                SizedBox(
                  width: 3.w,
                ),
                //column in the main row with image and the add button
                SizedBox(
                  height: 15.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //padding

                      //container with image
                      Container(
                        height: 12.h,
                        width: 26.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: imageChecker(), fit: BoxFit.fill),
                        ),
                      ),

                      //sized box for elevated button
                      Positioned(
                        bottom: 4,
                        child: Container(
                            height: 2.5.h,
                            width: 15.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 102, 163, 92),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "ADD",
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
