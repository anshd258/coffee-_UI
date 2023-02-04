import 'dart:convert';
import '../../widgets/Admin/reportstable.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/widgets/Admin/ConfirmationDialog.dart';
import 'package:inter_coffee/widgets/Admin/OrderDetailsDialog.dart';
import 'package:inter_coffee/widgets/Admin/OrderETA_Dialog.dart';
import 'package:json_table/json_table.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String fromdate = "DD/MM/YYYY";
  String todate = "DD/MM/YYYY";
  final String json1 =
      '[{ "Date": "12/23","Order No":"ORDER0001","Order By": "John C","Order Details": "Latte_Sugar","Order Status": "Pending"},{"Date": "12/23","Order No":"ORDER0002","Order By": "John M","Order Details": "Latte_Sugar","Order Status": "Pending"},{"Date": "12/23","Order No":"ORDER0002", "Order By": "John K","Order Details": "Latte_Sugar","Order Status": "Cancelled"}]';

  final String json2 =
      '[{"Date": "12/23","Order No":"ORDER0001","Order By": "John C","Order Details": "Latte_Sugar","Order Status": "Confirmed"},{"Date": "12/23","Order No":"ORDER0002","Order By": "John M","Order Details": "Latte_Sugar","Order Status": "Confirmed"},{ "Date": "12/23","Order No":"ORDER0003","Order By": "John K","Order Details": "Latte_Sugar","Order Status": "Confirmed"}]';

  final String json3 =
      '[{"Date": "12/23","Order No":"ORDER0001","Order By": "John C","Order Details": "Latte_Sugar","Order Status": "Completed"},{"Date": "12/23","Order No":"ORDER0002", "Order By": "John M","Order Details": "Latte_Sugar","Order Status": "Completed"},{"Date": "12/23","Order No":"ORDER0003","Order By": "John K","Order Details": "Latte_Sugar","Order Status": "Completed"}]';

  final List<Map<String, dynamic>> json5 = [
    {"Name": "Raman", "Item Name": "latte", "Number Of Deliveries": "25"},
    {"Name": "Raman", "Item Name": "latte", "Number Of Deliveries": "25"},
    {"Name": "Raman", "Item Name": "latte", "Number Of Deliveries": "25"}
  ];
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
                  color: const Color.fromRGBO(0, 0, 0, 0.06),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 3.w,
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromRGBO(77, 68, 64, 0.36),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: (1.h) / 2, horizontal: 1.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: 3.h,
                                            height: 3.h,
                                            child: Image.asset(
                                              "assets/coffee_cup.png",
                                              fit: BoxFit.fill,
                                            )),
                                        Text(
                                          "Create Orders",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
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
                                      // json = jsonDecode(json4);
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
                          if (tappedIndex == 3) ...[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'From',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      onConfirm: ((time) {
                                        setState(() {
                                          fromdate =
                                              "${time.day.toString()}/${time.month.toString()}/${time.year.toString()}";
                                        });
                                      }),
                                      currentTime: DateTime.now(),
                                      theme: DatePickerTheme(
                                        backgroundColor: Colors.transparent,
                                        cancelStyle: GoogleFonts.inter(
                                            color: Colors.redAccent.shade400,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                        doneStyle: GoogleFonts.inter(
                                            color: Colors.greenAccent.shade700,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                        itemStyle: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 3.h,
                                    width: 30.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          fromdate,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: Colors.grey.shade600,
                                              fontSize: 13.5.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.grey.shade600,
                                          size: 19.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  'To',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      onConfirm: ((time) {
                                        setState(() {
                                          todate =
                                              "${time.day.toString()}/${time.month.toString()}/${time.year.toString()}";
                                        });
                                      }),
                                      currentTime: DateTime.now(),
                                      theme: DatePickerTheme(
                                        backgroundColor: Colors.transparent,
                                        cancelStyle: GoogleFonts.inter(
                                            color: Colors.redAccent.shade400,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                        doneStyle: GoogleFonts.inter(
                                            color: Colors.greenAccent.shade700,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                        itemStyle: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 3.h,
                                    width: 30.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          todate,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: Colors.grey.shade600,
                                              fontSize: 13.5.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.grey.shade600,
                                          size: 19.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                          SizedBox(
                            height: 2.h,
                          ),
                          if (tappedIndex <= 2) ...[
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
                                    if (headerVal == "Order Status" &&
                                        value == "Pending") {
                                      OrderETA_Dialvog(context);
                                    }
                                    if (headerVal == "Order Status" &&
                                        value == "Confirmed") {
                                      ConfirmDialog(context, "READY TO PICK UP",
                                          () {
                                        Navigator.pushNamed(
                                            context, "/OrderConfirmed");
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
                                                textStyle:
                                                    headerVal == "Order Details"
                                                        ? const TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          )
                                                        : null,
                                                color: headerVal ==
                                                        "Order Details"
                                                    ? orderDetailsGreen
                                                    : headerVal ==
                                                            "Order Status"
                                                        ? value != "Pending" &&
                                                                value !=
                                                                    "Cancelled"
                                                            ? orderDetailsGreen
                                                            : value == "Pending"
                                                                ? pending
                                                                : value ==
                                                                        "Cancelled"
                                                                    ? cancelled
                                                                    : white
                                                        : white,
                                                fontSize: 14.sp,
                                                fontWeight: headerVal ==
                                                        "Order Details"
                                                    ? FontWeight.w500
                                                    : headerVal ==
                                                            "Order Status"
                                                        ? value != "Confirmed"
                                                            ? FontWeight.w500
                                                            : FontWeight.w400
                                                        : FontWeight.w400),
                                          ),
                                          headerVal == "Order Details"
                                              ? GestureDetector(
                                                  onTap: () {
                                                    OrderDetailsDialog(context);
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
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
                          ] else ...[
                            ReportsTable()
                          ],
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
