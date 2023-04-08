import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/products_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/cart_product_provider.dart';
import 'package:cart_stepper/cart_stepper.dart';

class CartProductList extends StatefulWidget {
  final CartModal e;
  const CartProductList({super.key, required this.e});

  @override
  State<CartProductList> createState() => _CartProductListState();
}

class _CartProductListState extends State<CartProductList> {
  int counter = 1;

  @override
  void initState() {
    counter = widget.e.quantity!;
    super.initState();
  }

  String firstChoice = "";
  String secondChoice = "";
  String thirdChoice = "";
  String FirstChoice() {
    if (widget.e.choice!.isNotEmpty) {
      if (widget.e.choice!.first.choice != null) {
        firstChoice = widget.e.choice!.first.choice!.first.toString();
      }
    }
    return firstChoice;
  }

  String SecondChoice() {
    if (widget.e.choice!.isNotEmpty) {
      if (widget.e.choice!.length >= 2) {
        secondChoice = widget.e.choice![1].choice!.first.toString();
      }
    }
    return secondChoice;
  }

  String ThirdChoice() {
    if (widget.e.choice!.isNotEmpty) {
      if (widget.e.choice!.length >= 3) {
        thirdChoice = widget.e.choice![2].choice!.first.toString();
      }
    }
    return thirdChoice;
  }

  @override
  Widget build(BuildContext context) {
    final product = context
        .watch<ProductsProvider>()
        .products
        .where((element) => element.id == widget.e.productId);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //for padding
        SizedBox(
          height: 2.h,
        ),
        // for detecting clicks and directing them to next page-3
        GestureDetector(
          // onTap: () =>
          //     Navigator.of(context).pushNamed('/page3', arguments: widget.e),
          child: GlassContainer.frostedGlass(
            height: 17.h,
            width: 93.w,
            borderWidth: 0,
            blur: 17,
            frostedOpacity: 0.04,
            // color: Color.fromARGB(40, 255, 255, 255),
            gradient: LinearGradient(
                colors: glassShadeConfirmOrder,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderColor: Colors.white24,
            borderRadius: BorderRadius.circular(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //for padding

                Center(
                  child: GlassContainer.frostedGlass(
                    height: 13.5.h,
                    width: 25.w,
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(product.first.img!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //main container with discription, rating etc.
                Container(
                  alignment: Alignment.centerLeft,
                  height: 15.h,
                  width: 60.w,
                  margin: EdgeInsets.only(left: 3.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name of the product
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              product.first.name!,
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                          ),
                          CartStepperInt(
                            value: counter,
                            size: 3.h,
                            numberSize: 0.8.w,
                            elevation: 0,
                            style: const CartStepperStyle(
                                activeBackgroundColor: Colors.transparent),
                            didChangeCount: (value) {
                              if (value == 0) {
                                context
                                    .read<CartProductsProvider>()
                                    .removeProduct(widget.e);
                              }
                              if (value <= 5) {
                                setState(() {
                                  counter = value;
                                  context.read<CartProductsProvider>().currentproduct.quantity = counter;
                                });
                              }
                            },
                          )
                        ],
                      ),

                      //pading
                      SizedBox(
                        height: 0.8.h,
                      ),
                      //inner row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //for showing ratings
                          Row(
                            children: [
                              Text(
                                FirstChoice()
                                // widget.e.choiceOfSugar!
                                ,
                                style: GoogleFonts.inter(
                                    fontSize: 12.5.sp,
                                    color: const Color.fromARGB(
                                        255, 205, 205, 205),
                                    fontWeight: FontWeight.w600),
                              ),
                              //for padding
                            ],
                          ),

                          //for padding

                          // veg symbol
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //for showing ratings
                          Row(
                            children: [
                              Text(
                                SecondChoice()
                                // widget.e.choiceOfSugar!
                                ,
                                style: GoogleFonts.inter(
                                    fontSize: 12.5.sp,
                                    color: const Color.fromARGB(
                                        255, 205, 205, 205),
                                    fontWeight: FontWeight.w600),
                              ),
                              //for padding
                            ],
                          ),

                          //for padding

                          // veg symbol
                        ],
                      ),
                      //padding between inner row and discription
                      SizedBox(
                        height: 0.5.h,
                      ),
                      //discription text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ThirdChoice()
                            // widget.e.choiceOfSugar!
                            ,
                            style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 197, 197, 197),
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w600,
                                textStyle: const TextStyle(
                                  wordSpacing: 1,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),

                      Divider(
                        height: .5.h,
                        thickness: 1,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        height: 3.4.h,
                        width: 60.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 32.w,
                                height: 3.4.h,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Instructions for Cafe",
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 197, 197, 197)),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 28.w,
                                height: 3.4.h,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Add More Items",
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 197, 197, 197)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //for padding
              ],
            ),
          ),
        ),
      ],
    );
  }
}
