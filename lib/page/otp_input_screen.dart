// ignore: file_names
import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:inter_coffee/widgets/otp_input_container.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({super.key});

  @override
  State<OtpInputScreen> createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  @override
  Widget build(BuildContext context) {
    final isloading = context.watch<LoginAuthProvider>().isloading;
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
          child: Stack(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(60, 31, 40, 50),
                ),
                child: Center(
                  child: OtpGlassContainer(
                      phonenumber: phoneNo
                          .toString()), //center glass container with inner widgets
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
