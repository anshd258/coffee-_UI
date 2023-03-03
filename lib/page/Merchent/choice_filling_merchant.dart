import 'package:flutter/material.dart';

import 'package:inter_coffee/models/products_list_model.dart';
import 'package:inter_coffee/page/Merchent/choice_filling_bottom_sheet.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:inter_coffee/widgets/pg3highpriobutton.dart';
import 'package:inter_coffee/widgets/pg3sheet.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChoiceFillingMerchant extends StatefulWidget {
  const ChoiceFillingMerchant({super.key});

  @override
  State<ChoiceFillingMerchant> createState() => _ChoiceFillingMerchantState();
}

class _ChoiceFillingMerchantState extends State<ChoiceFillingMerchant> {
  ValueNotifier<double> size = ValueNotifier<double>(0.00);
  ScrollController ctr = ScrollController();
  double offset = 40;

  @override
  void initState() {
    ctr.addListener(() {
      setState(() {
        if (ctr.offset == 0) {
          offset = 40;
        } else {
          offset = 20;
        }
      });
    });
    context.read<CartProductsProvider>().currentsession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList args =
        ModalRoute.of(context)?.settings.arguments as ProductList;
    context.read<CartProductsProvider>().currentproduct.productId = args.id;
    context.read<CartProductsProvider>().checkerLength = args.choice!.length;
    print(context.read<CartProductsProvider>().currentproduct.productId);

    //page 3 scaffold
    return Scaffold(
      body:
          //stack for bases image radient and main content
          Stack(
        children: [
          //base image
          Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/bg1.jpg"),
              fit: BoxFit.fill,
            )),
          ),
          //main content of tthe page
          // AnimatedPositioned(
          //   duration: const Duration(milliseconds: 200),
          //   top: offset.h,
          //   child: Container(
          //     height: 100.h,
          //     width: 100.w,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     child: SingleChildScrollView(
          //       controller: ctr,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Pg3BottomSheet(data: args),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
              child: SingleChildScrollView(
                  child: ChoiceFillingMerchantBottomSheet(data: args))),
          //bottom floating bar with high prioritycheckbox and submit button
          Positioned(
            bottom: 5.h,
            left: 5.w,
            child: Container(
                height: 8.h,
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 0.5,
                        color: const Color.fromARGB(70, 14, 14, 14)),
                    color: const Color.fromRGBO(51, 51, 51, 0.90)),
                child: Pg3highPrioButton(
                  selectedproduct: args,
                )),
          ),
          // back button
          Positioned(
            top: 5.h,
            left: 5.w,
            child: GestureDetector(
              onTap: (() => Navigator.pop(context)),
              child: Image.asset("assets/ICONS/arrow1.png"),
            ),
          ),
        ],
      ),
    );
  }
}
