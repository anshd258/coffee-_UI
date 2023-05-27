import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:inter_coffee/provider/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalProductContainer extends StatefulWidget {
  final CartModal e;
  const HorizontalProductContainer({super.key, required this.e});

  @override
  State<HorizontalProductContainer> createState() =>
      _HorizontalProductContainerState();
}

class _HorizontalProductContainerState
    extends State<HorizontalProductContainer> {
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

  int? counter;

  @override
  Widget build(BuildContext context) {
    final product = context
        .watch<ProductsProvider>()
        .products
        .where((element) => element.id == widget.e.productId);
    counter = widget.e.quantity!;
    return Row(
      children: [
        SizedBox(
          width: 3.w,
        ),
        //to detect the clicking on the boxes
        GestureDetector(
          onTap: () {},
          child:
              //main boxes in the row to display items
              GlassContainer.clearGlass(
            height: 25.h,
            width: 40.w,
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //container with image of the product
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 20.w,
                      width: 30.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(product.first.img!)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  //name of the product
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.first.name!,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
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
                                color: Colors.white60,
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
                                color: Colors.white60,
                                fontWeight: FontWeight.w600),
                          ),
                          //for padding
                        ],
                      ),

                      //for padding

                      // veg symbol
                    ],
                  ),
                  //padding between inner row and description
                  SizedBox(
                    height: 0.5.h,
                  ),
                  //description text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ThirdChoice()
                        // widget.e.choiceOfSugar!
                        ,
                        style: GoogleFonts.inter(
                            color: Colors.white60,
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w600,
                            textStyle: const TextStyle(
                              wordSpacing: 1,
                            )),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 4.h,
                      child: CartStepperInt(
                        value: counter,
                        size: 3.h,
                        numberSize: 0.8.w,
                        elevation: 0,
                        style: const CartStepperStyle( activeBackgroundColor: Colors.transparent ),
                        didChangeCount: (value) {
                          if (value == 0) {
                            context.read<CartProductsProvider>().removeProduct(widget.e);
                          } else if (value <= 5) {
                            setState(() {
                              counter = value;
                              context
                                .read<CartProductsProvider>()
                                .increaseProductQuantity(
                                  widget.e.productId!,
                                  counter!
                                );
                            });
                          }
                        },
                      ),
                    ),
                  )
                  //for padding
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
      ],
    );
  }
}
