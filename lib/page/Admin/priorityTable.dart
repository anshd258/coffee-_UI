import 'dart:convert';
import 'package:inter_coffee/provider/Admin/orders_table_provider.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:inter_coffee/provider/merchantProvider/tablePriorityProvider.dart';

import 'package:inter_coffee/provider/reportsProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
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

class PriorityTable extends StatefulWidget {
  const PriorityTable({super.key});

  @override
  State<PriorityTable> createState() => _PriorityTableState();
}

class _PriorityTableState extends State<PriorityTable> {
  void getPlacedOrdersList() async {
    await getOrdersPlaced();
  }

  @override
  void initState() {
    getPlacedOrdersList();
    context.read<TablePriorityProvider>().getOrders("ORDER_PLACED");

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
    "Order Confirmed",
    "Orders Progress",
    "Completed Orders",
  ];
  bool isSelected = false;
  String id = "";
  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;

    final List<dynamic>? data =
        context.watch<TablePriorityProvider>().orderJsonTableData;
    if (role == 'admin') {
      tappedIndex = 4;
    }
    String headerVal = "";
    var json = jsonDecode(json1);
    List<dynamic> callRightJSON(ta8ppedIndex) {
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
            leading: SizedBox(
              width: 1.w,
            ),
            leadingWidth: 0,
            title: Text(
              role == 'admin' ? "Reports" : "Orders",
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
                          if (role == 'merchant') ...[
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/OrderConfirmed");
                                },
                                child: SizedBox(
                                  width: 35.w,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromRGBO(
                                          77, 68, 64, 0.36),
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
                          ],
                          SizedBox(
                            height: 2.h,
                          ),
                          if (role == 'merchant') ...[
                            SizedBox(
                              height: 3.h,
                              child: ListView.builder(
                                itemCount: filterList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (index == 0) {
                                          context
                                              .read<TablePriorityProvider>()
                                              .getOrders("ORDER_PLACED");
                                        } else if (index == 1) {
                                          context
                                              .read<TablePriorityProvider>()
                                              .getOrders("ORDER_CONFIRMED");
                                        } else if (index == 2) {
                                          context
                                              .read<TablePriorityProvider>()
                                              .getOrders("ORDER_IN_PROGRESS");
                                        } else if (index == 3) {
                                          context
                                              .read<TablePriorityProvider>()
                                              .getOrders("ORDER_COMPLETED");
                                        }
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
                                          ? const Color.fromRGBO(
                                              36, 36, 36, 0.7)
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
                          ],
                          SizedBox(
                            height: 2.h,
                          ),
                          if (tappedIndex == 4) ...[
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
                                          fromdate = DateFormat("yyyy-MM-dd")
                                              .format(time);
                                          // "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
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
                                          todate = DateFormat("yyyy-MM-dd")
                                              .format(time);
                                          // "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
                                          context
                                              .read<ReportsProvider>()
                                              .fetchReports(fromdate.toString(),
                                                  todate.toString());
                                        });
                                      }),
                                      currentTime: DateTime.now(),
                                      theme: DatePickerTheme(
                                        backgroundColor:
                                            const Color.fromARGB(30, 0, 0, 0),
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
                          if (tappedIndex <= 3 && data != null) ...[
                            data.isEmpty
                                ? Container(
                                    width: 100.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Data Avilabe",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white70),
                                    ))
                                : JsonTable(
                                    // json = callRightJSON(tappedIndex),
                                    data,
                                    // onRowSelect: (index, map) {
                                    //   ConfirmDialog(context, map);
                                    // },
                                    columns: [
                                      JsonTableColumn('createdDate',
                                          defaultValue: null, label: "Date"),
                                      JsonTableColumn('orderId',
                                          defaultValue: null,
                                          label: "Order No"),
                                      JsonTableColumn('userId.name',
                                          defaultValue: null,
                                          label: "Order By"),
                                      JsonTableColumn('currentState',
                                          defaultValue: null,
                                          label: "Order Status"),
                                      JsonTableColumn('next_state_est_time',
                                          defaultValue: null,
                                          valueBuilder: (value) {
                                        final time = DateTime.parse(value);

                                        return time.minute.toString();
                                      }, label: "Estimated Time"),
                                      JsonTableColumn('orderId',
                                          defaultValue: null,
                                          label: "Order Details"),
                                    ],
                                    tableHeaderBuilder: (header) {
                                      headerVal = header.toString();
                                      return Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                          color: tableBlack,
                                          border:
                                              Border.all(color: borderWhite),
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
                                    allowRowHighlight: true,
                                    onRowSelect: (index, map) {
                                      id = map['orderId'];
                                      isSelected = true;
                                      if (tappedIndex == 0) {
                                        if (id.isNotEmpty &&
                                            isSelected == true) {
                                          OrderETA_Dialvog(
                                              context, id, 'priority');
                                          isSelected = false;
                                          id = '';
                                        }
                                      } else if (tappedIndex == 1) {
                                        ConfirmDialog(
                                            context,
                                            "Put Order In Processing",
                                            "ORDER_IN_PROGRESS",
                                            id,
                                            "ORDER_CONFIRMED",
                                            'priority');
                                      } else if (tappedIndex == 2) {
                                        ConfirmDialog(
                                            context,
                                            "Put Order In Processing",
                                            "ORDER_COMPLETED",
                                            id,
                                            "ORDER_IN_PROGRESS",
                                            'priority');
                                      }
                                    },
                                    rowHighlightColor:
                                        Colors.yellow[500]!.withOpacity(0.5),
                                    tableCellBuilder: (value) {
                                      return Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                          color: tableBlack,
                                          border:
                                              Border.all(color: borderWhite),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                headerVal == "Order Details" ||
                                                        headerVal ==
                                                            "Order Status"
                                                    ? ""
                                                    : value,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.inter(
                                                    textStyle: headerVal ==
                                                            "Order Details"
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
                                                                : value ==
                                                                        "Pending"
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
                                                            ? value !=
                                                                    "Confirmed"
                                                                ? FontWeight
                                                                    .w500
                                                                : FontWeight
                                                                    .w400
                                                            : FontWeight.w400),
                                              ),
                                              headerVal == "Order Details"
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        // OrderDetailsDialog(
                                                        //   context,
                                                        // );
                                                      },
                                                      child: Center(
                                                        child: Text("view More",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: GoogleFonts.inter(
                                                                fontSize:
                                                                    15.5.sp,
                                                                color:
                                                                    borderWhite,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    )
                                                  : const Text(""),
                                              headerVal == "Order Status"
                                                  ? Center(
                                                      child: Text(
                                                          value
                                                              .toString()
                                                              .replaceAll(
                                                                  RegExp(r'_'),
                                                                  ' '),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: GoogleFonts.inter(
                                                              fontSize: 15.5.sp,
                                                              color: headerVal == "Order Status"
                                                                  ? value != "ORDER_IN_PROGRESS" && value != "ORDER_CANCELLED"
                                                                      ? orderDetailsGreen
                                                                      : value == "ORDER_IN_PROGRESS"
                                                                          ? pending
                                                                          : value == "ORDER_CANCELLED"
                                                                              ? cancelled
                                                                              : white
                                                                  : white,
                                                              decoration: TextDecoration.underline,
                                                              fontWeight: FontWeight.w500)),
                                                    )
                                                  : const Text("")
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                            SizedBox(
                              height: 8.h,
                            )
                          ] else if (tappedIndex > 3 && data != null) ...[
                            Container(
                                margin: EdgeInsets.only(bottom: 7.h),
                                child: ReportsTable())
                          ] else ...[
                            const CircularProgressIndicator.adaptive()
                          ]
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
