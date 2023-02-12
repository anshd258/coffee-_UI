import 'package:flutter/material.dart';

import 'package:inter_coffee/models/products_list_model.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:inter_coffee/widgets/pg3highpriobutton.dart';
import 'package:inter_coffee/widgets/pg3sheet.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList args =
        ModalRoute.of(context)?.settings.arguments as ProductList;

    currentproduct.imgUrl = args.img!;
    currentproduct.name = args.name!;
    currentproduct.productId = args.id!;

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
          //BROWN gradient above the image

          //product image in stack
          Positioned(
            child: SizedBox(
              height: 50.h,
              width: 100.w,
              child: Image(
                image: NetworkImage(args.img!),
                // image: AssetImage(args.img!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          //main content of tthe page
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: offset.h,
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                controller: ctr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Pg3BottomSheet(data: args),
                  ],
                ),
              ),
            ),
          ),
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
