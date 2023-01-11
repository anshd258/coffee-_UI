import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/pg2maincontain.dart';
import '../widgets/PG2bottomnavbar.dart';

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
          Stack(children: [
        //base image of the page
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/bg1.jpg"),
            ),
          ),
        ),
        // BROWN gradient over the image
        Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Color.fromARGB(50, 207, 123, 75)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        //main glass container aith all the content
        GlassContainer.clearGlass(
            height: 100.h,
            width: 100.w,
            blur: 7,
            borderColor: Colors.transparent,
            child: const PG2maincont()),

        //bottom nav bar with functionality
        Positioned(
          bottom: -0.5.h,
          left: 1.w,
          right: 1.w,
          child: const Pg2BottonavBar(),
        )
      ]),
    );
  }
}
