// ignore: file_names
import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/widgets/otpinputcontainer.dart';
import '../widgets/glassContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  @override
  Widget build(BuildContext context) {
    final phoneNo = ModalRoute.of(context)?.settings.arguments;
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: backgroundFirst3Screen,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: Color.fromARGB(60, 31, 40, 50),
            ),
            child: Center(
              child: OtpGlassContain(
                  phonenumber: phoneNo
                      .toString()), //center glass container with inner widgets
            ),
          ),
        ),
      ),
    );
  }
}
