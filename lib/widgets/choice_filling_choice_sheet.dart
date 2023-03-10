import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/page/ProductList/product_list_all_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';
import '../models/products_list_model.dart';

class ChoiceFillingChoiceSheet extends StatefulWidget {
  final ProductList data;
  const ChoiceFillingChoiceSheet({super.key, required this.data});

  @override
  State<ChoiceFillingChoiceSheet> createState() => _ChoiceFillingChoiceSheetState();
}

class _ChoiceFillingChoiceSheetState extends State<ChoiceFillingChoiceSheet> {
  //dropdown meenue state
  var dropdownvalue = 1;
  @override
  void initState() {
    context.read<CartProductsProvider>().currentproduct.quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.watch<CartProductsProvider>().currentproduct.quantity);
    final ProductList productsList =
        ModalRoute.of(context)?.settings.arguments as ProductList;

    id = widget.data.id!;
    name = widget.data.name!;
    discription = widget.data.description!;
    ratings = "4.9";
    price = "100";
    numberOfReviews = "375";
    imageUrl = widget.data.img!;
    quantity = "1";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //main glasscontainer
        GlassContainer.frostedGlass(
          height: (50 + productsList.choice!.length * 25).h,
          width: 100.w,
          blur: 20,
          frostedOpacity: 0.00,
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
                            if (value != null) {
                              context
                                  .read<CartProductsProvider>()
                                  .currentproduct
                                  .quantity = int.parse(value);
                            }

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

              Expanded(
                child: AllProductPropertiesRender(choices: productsList.choice),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
