import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:glass_kit/glass_kit.dart';

import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  ValueNotifier<double> size = ValueNotifier<double>(0.00);
  var dropdownvalue = 1;
  bool first = false;
  bool two = false;
  bool three = false;
  bool four = false;
  int v = 1;
  bool checknox = false;
  List values = [
    "Sikkim milk",
    "Full Cream Milk",
    "Almond Milk",
    "Oat Milk",
    "Soy Milk",
    "Lactose Free Milk"
  ];
  List suger = [
    "Sugar X1",
    "Sugar X2",
    "½ Sugar",
    "No Sugar",
  ];

  @override
  Widget build(BuildContext context) {
    switch (v) {
      case 1:
        {
          first = true;
          two = false;
          three = false;
          four = false;
        }
        break;
      case 2:
        {
          first = false;
          two = true;
          three = false;
          four = false;
        }
        break;
      case 3:
        {
          first = false;
          two = false;
          three = true;
          four = false;
        }
        break;
      case 4:
        {
          first = false;
          two = false;
          three = false;
          four = true;
        }
        break;
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/1.png"),
              fit: BoxFit.fill,
            )),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(image: AssetImage("assets/logo.png")),
                  GlassContainer.clearGlass(
                    height: 100.h,
                    width: 100.w,
                    blur: 8,
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30), bottom: Radius.zero),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Latte",
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                            SizedBox(
                              width: 60.w,
                            ),
                            DropdownButton<String>(
                              value: dropdownvalue.toString(),
                              style: GoogleFonts.inter(fontSize: 12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              iconEnabledColor:
                                  const Color.fromARGB(255, 217, 217, 217),
                              focusColor: Colors.white30,
                              dropdownColor: Colors.white30,
                              items: [
                                const DropdownMenuItem(
                                  value: '1',
                                  child: Text('1'),
                                ),
                                const DropdownMenuItem(
                                  value: '2',
                                  child: Text('2'),
                                ),
                                const DropdownMenuItem(
                                  value: '3',
                                  child: Text('3'),
                                ),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownvalue = int.parse(value!);
                                });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "4.9",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color.fromARGB(255, 197, 197, 197),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber.shade300,
                              size: 18,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "(458)",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Image(image: AssetImage("assets/6.png"))
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 85.w,
                          child: Text(
                            "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
                            style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 197, 197, 197),
                                fontSize: 9,
                                textStyle: TextStyle(
                                  wordSpacing: 1,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Choice of Cup Filling",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 15.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    v = 1;
                                  });
                                },
                                child: Text(
                                  "FULL",
                                  style: GoogleFonts.inter(
                                      color:
                                          first ? Colors.white : Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    backgroundColor: first
                                        ? Colors.greenAccent.shade700
                                        : Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 17.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    v = 2;
                                  });
                                },
                                child: Text(
                                  "1/2 FULL",
                                  style: GoogleFonts.inter(
                                      color: two ? Colors.white : Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    backgroundColor: two
                                        ? Colors.greenAccent.shade700
                                        : Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 17.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    v = 3;
                                  });
                                },
                                child: Text(
                                  "3/4 FULL",
                                  style: GoogleFonts.inter(
                                      color:
                                          three ? Colors.white : Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    backgroundColor: three
                                        ? Colors.greenAccent.shade700
                                        : Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 17.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    v = 4;
                                  });
                                },
                                child: Text(
                                  "1/4 FULL",
                                  style: GoogleFonts.inter(
                                      color: four ? Colors.white : Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    backgroundColor: four
                                        ? Colors.greenAccent.shade700
                                        : Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              " Choice of Milk",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 18.h,
                          width: 90.w,
                          alignment: Alignment.centerLeft,
                          child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 3.5 / 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              children: values.map((e) {
                                final _ctr = ValueNotifier<bool>(false);
                                @override
                                void initState() {
                                  super.initState();
                                  _ctr.addListener(() {
                                    setState(() {});
                                  });
                                }

                                return Container(
                                    height: 3.h,
                                    width: 30.w,
                                    child: Row(
                                      children: [
                                        AdvancedSwitch(
                                          width: 6.w,
                                          height: 2.h,
                                          controller: _ctr,
                                          enabled: true,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          e,
                                          style: GoogleFonts.inter(
                                              color: const Color.fromARGB(
                                                  255, 197, 197, 197),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ));
                              }).toList()),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              " Choice of Suger",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 18.h,
                          width: 90.w,
                          alignment: Alignment.centerLeft,
                          child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 3.5 / 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              children: suger.map((e) {
                                final _ctr = ValueNotifier<bool>(false);
                                @override
                                void initState() {
                                  super.initState();
                                  _ctr.addListener(() {
                                    setState(() {});
                                  });
                                }

                                return Container(
                                    height: 3.h,
                                    width: 30.w,
                                    child: Row(
                                      children: [
                                        AdvancedSwitch(
                                          width: 6.w,
                                          height: 2.h,
                                          controller: _ctr,
                                          enabled: true,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          e,
                                          style: GoogleFonts.inter(
                                              color: const Color.fromARGB(
                                                  255, 197, 197, 197),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ));
                              }).toList()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: 8.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(70, 14, 14, 14)),
                  color: const Color.fromRGBO(51, 51, 51, 0.90)),
              child: Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      side: BorderSide(color: Colors.white),
                      activeColor: Colors.greenAccent.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      value: checknox,
                      onChanged: (onChanged) {
                        setState(() {
                          checknox = onChanged!;
                        });
                      }),
                  Text(
                    "High Priority",
                    style: GoogleFonts.inter(
                      color: const Color.fromRGBO(205, 205, 205, 1),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Icon(
                    Icons.crisis_alert,
                    color: Color.fromARGB(255, 255, 55, 55),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(28.w, 4.h),
                        backgroundColor: Colors.greenAccent.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                  )
                ],
              ),
            ),
            bottom: 5.h,
            left: 5.w,
          )
        ],
      ),
    );
  }
}
