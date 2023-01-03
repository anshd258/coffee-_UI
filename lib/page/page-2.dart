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
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/1.png"),
            ),
          ),
        ),
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
        GlassContainer.clearGlass(
          height: 100.h,
          width: 100.w,
          blur: 7,
          borderColor: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              name_bar2(size: size),
              SizedBox(
                height: 1.h,
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
                      maxWidth: 90.w,
                      maxHeight: 5.h,
                    )),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                  width: 100.w,
                  height: 35.h,
                  color: Colors.black26,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Most Popular Beverages",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 205, 205, 205),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SingleChildScrollView(
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
                                        .pushNamed("/page3", arguments: e);
                                  },
                                  child: GlassContainer.clearGlass(
                                    height: 25.h,
                                    width: 45.w,
                                    borderColor: Colors.transparent,
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
                                              image: AssetImage(
                                                  e["image"].toString()),
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
                                                fontSize: 8,
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
                                                color: Colors.black,
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
                                                fontSize: 9,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Icon(
                                              Icons.add_box_rounded,
                                              color: const Color.fromARGB(
                                                  255, 102, 163, 92),
                                              size: 4.h,
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
                      ),
                    ],
                  )),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   Get it instantly",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 205, 205, 205),
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                height: 35.5.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: productsInfo.map((e) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed('/page3', arguments: e),
                            child: GlassContainer.clearGlass(
                              height: 15.h,
                              width: 90.w,
                              blur: 15,
                              borderColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(17),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 12.h,
                                    width: 55.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            e["name"],
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 205, 205, 205),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              e["rating"],
                                              style: GoogleFonts.inter(
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5.w,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber.shade300,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              e["noreviews"],
                                              style: GoogleFonts.inter(
                                                fontSize: 10,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Image(
                                                image:
                                                    AssetImage("assets/6.png"))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          e["discription"],
                                          style: GoogleFonts.inter(
                                              color: const Color.fromARGB(
                                                  255, 197, 197, 197),
                                              fontSize: 8,
                                              textStyle: TextStyle(
                                                wordSpacing: 1,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Container(
                                        height: 11.h,
                                        width: 24.w,
                                        alignment: Alignment.center,
                                        child: Image(
                                            image: AssetImage(e["image"])),
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                        width: 15.w,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 3,
                                                backgroundColor: Color.fromARGB(
                                                    255, 102, 163, 92)),
                                            onPressed: () {},
                                            child: Text(
                                              "ADD",
                                              style: GoogleFonts.inter(
                                                  fontSize: 9),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
