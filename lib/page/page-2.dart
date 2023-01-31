import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/pg2maincontain.dart';

class page_2 extends StatefulWidget {
  const page_2({super.key});

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> {
  @override
  Widget build(BuildContext context) {
    //page 2 scaffold
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          //stack for bottom nav bar  base image gradeint

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
                child: const PG2maincont()),
          ),
        ),
      ),
      // BROWN gradient over the image

      //main glass container aith all the content

      //bottom nav bar with functionality
    );
  }
}
