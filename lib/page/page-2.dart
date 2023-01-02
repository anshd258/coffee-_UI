import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/glassContainer.dart';
import '../widgets/namebar2.dart';

class page_2 extends StatefulWidget {
  const page_2({super.key});

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/1.png"),
          ),
        ),
        child: GlassContainer.clearGlass(
          height: size.height,
          width: size.width,
          blur: 7,
          borderColor: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: size.height - 700,
              ),
              name_bar2(size: size),
              SizedBox(
                height: size.height - 760,
              ),
              TextField(
                cursorColor: Color.fromARGB(255, 182, 182, 182),
                decoration: InputDecoration(
                    hintText: "Search favorite Beverages",
                    hintStyle: GoogleFonts.inter(
                      color: Color.fromARGB(100, 182, 182, 182),
                      fontSize: 12,
                    ),
                    suffixIcon: Icon(
                      Icons.tune_rounded,
                      color: Color.fromARGB(255, 182, 182, 182),
                    ),
                    prefixIcon: Icon(Icons.search,
                        color: Color.fromARGB(255, 182, 182, 182)),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    fillColor: Colors.white,
                    constraints: BoxConstraints(
                      maxWidth: size.width - 30,
                      maxHeight: size.height - 730,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
