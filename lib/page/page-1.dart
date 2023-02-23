// ignore: file_names
import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/glassContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  @override
  Widget build(BuildContext context) {
    final isloading = context.watch<LoginAuthProvider>().isloading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //base image of the page
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/bg1.jpg',
            ),
          ),
        ),
        child: Container(
          //brown gradient over the base image
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(80, 114, 235, 0),
                Color.fromRGBO(80, 114, 235, 0),
                Color.fromRGBO(80, 114, 235, 0),
                Color.fromRGBO(207, 123, 75, 0.51)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(60, 31, 40, 50),
                ),
                child: Center(
                  child:
                      glass_container(), //center glass container with inner widgets
                ),
              ),
              if (isloading) ...[
                Container(
                  color: Colors.black38,
                  child: const Center(
                      child: CircularProgressIndicator.adaptive(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white70))),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
