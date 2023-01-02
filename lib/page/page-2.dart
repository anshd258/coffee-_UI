import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/glassContainer.dart';
import '../widgets/namebar2.dart';
import 'package:sizer/sizer.dart';

class page_2 extends StatefulWidget {
  const page_2({super.key});

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> {
  List productsInfo = [
    {
      "name": "Hot Cappuccino",
      "rating": "4.9",
      "noreviews": "(456)",
      "image": "assets/3.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
    {
      "name": "Lattè",
      "rating": "4.5",
      "noreviews": "(896)",
      "image": "assets/2.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
    {
      "name": "Flate White",
      "rating": "4.9",
      "noreviews": "(626)",
      "image": "assets/4.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
  ];

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
              ),
              SizedBox(
                height: 4.5.h,
              ),
              Container(
                  width: 100.w,
                  height: 32.h,
                  color: Colors.black26,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: productsInfo.map((e) {
                        print(e["image"]);
                        return Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/page3", arguments: e["image"]);
                              },
                              child: GlassContainer.clearGlass(
                                height: 25.h,
                                width: 45.w,
                                borderRadius: BorderRadius.circular(8),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        child: Image(
                                          image:
                                              AssetImage(e["image"].toString()),
                                        ),
                                        height: 13.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "  " + e["name"],
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              255, 205, 205, 205),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.6.h,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "      " + e["type"],
                                        style: GoogleFonts.inter(
                                            color: const Color.fromARGB(
                                                255, 197, 197, 197),
                                            fontSize: 7,
                                            textStyle: TextStyle(
                                              wordSpacing: 1,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.7.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          e["rating"],
                                          style: GoogleFonts.inter(
                                            fontSize: 9,
                                            color: Color.fromARGB(
                                                255, 197, 197, 197),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber.shade300,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          e["noreviews"],
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                                255, 197, 197, 197),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Icon(
                                          Icons.add_circle_rounded,
                                          color:
                                              Color.fromRGBO(102, 163, 92, 1),
                                          size: 28,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
