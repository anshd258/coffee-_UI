// ignore: file_names
import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/login_glass_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      LoginGlassContainer(), //center glass container with inner widgets
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
