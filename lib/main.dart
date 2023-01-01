import 'package:flutter/material.dart';
import './page/page-2.dart';
import './page/page-1.dart';

void main() {
  runApp(const main_app());
}

class main_app extends StatefulWidget {
  const main_app({super.key});

  @override
  State<main_app> createState() => _main_appState();
}

class _main_appState extends State<main_app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const page_1(),
        "/page_2": (context) => const page_2()
      },
    );
  }
}
