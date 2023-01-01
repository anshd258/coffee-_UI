// ignore: file_names
import 'package:flutter/material.dart';
import '../widgets/glassContainer.dart';

class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/1.png'),
          ),
        ),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Color.fromARGB(100, 207, 123, 75)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: glass_container(size: size),
          ),
        ),
      ),
    );
  }
}
