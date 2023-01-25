import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/widgets/Admin/ConfirmationDialog.dart';
import 'package:inter_coffee/widgets/Admin/OrderDetailsDialog.dart';
import 'package:inter_coffee/widgets/Admin/OrderETA_Dialog.dart';
import 'package:json_table/json_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final String json1 =
      '[{ "Date": "12/23","Order No":"ORDER0001","Order By": "John C","Order Details": "Latte_Sugar","Order Status": "Pending"},{"Date": "12/23","Order No":"ORDER0002","Order By": "John M","Order Details": "Latte_Sugar","Order Status": "Pending"},{"Date": "12/23","Order No":"ORDER0002", "Order By": "John K","Order Details": "Latte_Sugar","Order Status": "Cancelled"}]';

  final String json2 =
      '[{"Date": "12/23","Order No":"ORDER0001","Order By": "John C","Order Details": "Latte_Sugar","Order Status": "Confirmed"},{"Date": "12/23","Order No":"ORDER0002","Order By": "John M","Order Details": "Latte_Sugar","Order Status": "Confirmed"},{ "Date": "12/23","Order No":"ORDER0003","Order By": "John K","Order Details": "Latte_Sugar","Order Status": "Confirmed"}]';

  final String json3 =
      '[{"Date": "12/23","Order No":"ORDER0001","Order By": "John C","Order Details": "Latte_Sugar","Order Status": "Completed"},{"Date": "12/23","Order No":"ORDER0002", "Order By": "John M","Order Details": "Latte_Sugar","Order Status": "Completed"},{"Date": "12/23","Order No":"ORDER0003","Order By": "John K","Order Details": "Latte_Sugar","Order Status": "Completed"}]';

  int tappedIndex = 0;
  List<String> filterList = [
    "New Orders",
    "Orders Progress",
    "Completed Orders",
    "Reports"
  ];

  @override
  Widget build(BuildContext context) {
    String headerVal = "";
    var json = jsonDecode(json1);
    List<dynamic> callRightJSON(tappedIndex) {
      switch (tappedIndex) {
        case 0:
          json = jsonDecode(json1);
          break;
        case 1:
          json = jsonDecode(json2);
          break;
        case 2:
          json = jsonDecode(json3);
          break;
        default:
          json = jsonDecode(json1);
          break;
      }
      return json;
    }

    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/AdminBG.jpg",
            ),
            fit: BoxFit.fill),
      ),
      child: GlassContainer.frostedGlass(
        width: 100.w,
        height: 100.h,
        borderWidth: 0,
        blur: 17,
        frostedOpacity: 0.03,
        gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.55),
                Color.fromRGBO(0, 0, 0, 0.85)
              ]),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            title: Text(
              "Orders",
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  color: white, fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color.fromRGBO(77, 68, 64, 0.36),
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                height: 2.h,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
              Expanded(
                child: GlassContainer.frostedGlass(
                  width: 100.w,
                  height: 87.h,
                  blur: 17,
                  frostedOpacity: 0.03,
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 5.w,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/OrderConfirmed");
                              },
                              child: SizedBox(
                                width: 35.w,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(77, 68, 64, 0.36),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: (1.h) / 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        SizedBox(
                                            width: 3.h,
                                            height: 3.h,
                                            child: Image.asset(
                                              "assets/coffee_cup.png",
                                              fit: BoxFit.fill,
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Create Orders",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 3.h,
                            child: ListView.builder(
                              itemCount: filterList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      tappedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 4.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    margin: EdgeInsets.only(right: 2.w),
                                    color: tappedIndex == index
                                        ? const Color.fromRGBO(36, 36, 36, 0.7)
                                        : Colors.transparent,
                                    child: Text(
                                      filterList[index].toString(),
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.inter(
                                          color: white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          JsonTable(
                            json = callRightJSON(tappedIndex),
                            // onRowSelect: (index, map) {
                            //   ConfirmDialog(context, map);
                            // },
                            tableHeaderBuilder: (header) {
                              headerVal = header.toString();
                              return Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: tableBlack,
                                  border: Border.all(color: borderWhite),
                                ),
                                child: Center(
                                  child: Text(
                                    header.toString(),
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              );
                            },
                            tableCellBuilder: (value) {
                              return GestureDetector(
                                onTap: () {
                                  if( headerVal == "Order Status" && value == "Pending" ) {
                                    OrderETA_Dialvog(context);
                                  }
                                  if( headerVal == "Order Status" && value == "Confirmed" ) {
                                    ConfirmDialog(context, "READY TO PICK UP", (){
                                      Navigator.pushNamed(context, "/OrderConfirmed");
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color: tableBlack,
                                    border: Border.all(color: borderWhite),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          value,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                            textStyle: headerVal == "Order Details" 
                                              ? const TextStyle(
                                                decoration: TextDecoration.underline,
                                              ) 
                                                : null ,
                                            color: headerVal == "Order Details"
                                                ? orderDetailsGreen
                                                : headerVal == "Order Status"
                                                    ? value != "Pending" &&
                                                            value != "Cancelled"
                                                        ? orderDetailsGreen
                                                        : value == "Pending"
                                                            ? pending
                                                            : value == "Cancelled"
                                                                ? cancelled
                                                                : white
                                                    : white,
                                            fontSize: 14.sp,
                                            fontWeight: headerVal == "Order Details"
                                                ? FontWeight.w500
                                                : headerVal == "Order Status"
                                                    ? value != "Confirmed"
                                                        ? FontWeight.w500
                                                        : FontWeight.w400
                                                    : FontWeight.w400
                                          ),
                                        ),
                                        headerVal == "Order Details" 
                                         ? GestureDetector(
                                          onTap: (){
                                            OrderDetailsDialog(context);
                                          },
                                           child: Center(
                                             child: Icon( 
                                              Icons.remove_red_eye_outlined, 
                                              color: white,
                                              size: 19.5.sp,
                                             ),
                                           ),
                                         )
                                          : const Text("")
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
