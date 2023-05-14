import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/widgets/dialog_box.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/product_list_main_container.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    //page 2 scaffold
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          //stack for bottom nav bar  base image gradient
          //base image of the page
          SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/bg1.jpg"),
            ),
          ),
          child: Container(
            height: 100.h,
            padding: const EdgeInsets.all(0),
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: page2BGgradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: GlassContainer.frostedGlass(
                height: 100.h,
                width: 100.w,
                blur: 17,
                frostedOpacity: 0.04,
                gradient: LinearGradient(
                  colors: backgroundFirst3Screen,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderColor: Colors.transparent,
                child: const ProductListMainContainer()),
          ),
        ),
      ),
      // BROWN gradient over the image

      //main glass container aith all the content

      //bottom nav bar with functionality
    );
  }
}
