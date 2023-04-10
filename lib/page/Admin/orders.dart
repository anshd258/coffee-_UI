import 'package:inter_coffee/provider/Admin/orders_table_provider.dart';
import 'package:inter_coffee/provider/order_history_provider.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/table_with_status_provider.dart';
import 'package:inter_coffee/provider/router.dart';
import 'package:inter_coffee/widgets/Admin/order_details_dialog.dart';
import 'package:provider/provider.dart';
import '../../widgets/Admin/reports_table.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/widgets/Admin/confirmation_dialog.dart';
import 'package:inter_coffee/widgets/Admin/order_eta_dialog.dart';
import 'package:json_table/json_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllOrdersTable extends StatefulWidget {
  const AllOrdersTable({super.key});

  @override
  State<AllOrdersTable> createState() => _AllOrdersTableState();
}

class _AllOrdersTableState extends State<AllOrdersTable> {
  void getPlacedOrdersList() async {
    await getOrdersPlaced();
  }

  String status = "ORDER_PLACED";

  @override
  void initState() {
    getPlacedOrdersList();
    context.read<TableWithStatusProvider>().getOrders(status);

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
    // "Orders Progress",
    "Order Ready to Pick Up",
    "Completed Orders",
    "Cancelled"
  ];
  bool isSelected = false;
  bool isSelect = false;
  String id = "";
  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;

    final List<dynamic>? data =
        context.watch<TableWithStatusProvider>().orderJsonTableData;
    if (role == 'admin') {
      tappedIndex = 6;
    }
    String headerVal = "";

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
          body: Stack(
            children: [
              Column(
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
                                      context.read<routing>().settingRoute(6);
                                    },
                                    child: SizedBox(
                                      width: 35.w,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromRGBO(
                                              77, 68, 64, 0.36),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: (1.h) / 2,
                                              horizontal: 1.w),
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
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (index == 0) {
                                              context
                                                  .read<
                                                      TableWithStatusProvider>()
                                                  .getOrders("ORDER_PLACED");
                                            } else if (index == 1) {
                                              context
                                                  .read<
                                                      TableWithStatusProvider>()
                                                  .getOrders("ORDER_CONFIRMED");
                                            }
                                            // else if (index == 2) {
                                            //   context
                                            //       .read<
                                            //           TableWithStatusProvider>()
                                            //       .getOrders(
                                            //           "ORDER_IN_PROGRESS");
                                            // }
                                            else if (index == 2) {
                                              context
                                                  .read<
                                                      TableWithStatusProvider>()
                                                  .getOrders(
                                                      "ORDER_READY_FOR_PICKUP");
                                            } else if (index == 3) {
                                              context
                                                  .read<
                                                      TableWithStatusProvider>()
                                                  .getOrders("ORDER_COMPLETED");
                                            } else if (index == 4) {
                                              context
                                                  .read<
                                                      TableWithStatusProvider>()
                                                  .getOrders("ORDER_CANCELLED");
                                            }
                                            tappedIndex = index;
                                            // json = jsonDecode(json4);
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 4.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
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
                              if (tappedIndex <= 5 && data != null) ...[
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
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            JsonTable(
                                              // json = callRightJSON(tappedIndex),
                                              data,
                                              // onRowSelect: (index, map) {
                                              //   ConfirmDialog(context, map);
                                              // },
                                              columns: tappedIndex == 1
                                                  // || tappedIndex == 2
                                                  ? [
                                                      JsonTableColumn(
                                                        'createdDate',
                                                        defaultValue: null,
                                                        label: "Date",
                                                        valueBuilder: (value) {
                                                          final createdDate =
                                                              DateTime.parse(
                                                                  value);
                                                          final utcTime =
                                                              DateTime.utc(
                                                                  createdDate
                                                                      .year,
                                                                  createdDate
                                                                      .month,
                                                                  createdDate
                                                                      .day,
                                                                  createdDate
                                                                      .hour,
                                                                  createdDate
                                                                      .minute,
                                                                  createdDate
                                                                      .second);
                                                          final localTime =
                                                              utcTime.toLocal();
                                                          return "${localTime.day}-${localTime.month}-${localTime.year.toString().substring(2)} ${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
                                                        },
                                                      ),
                                                      JsonTableColumn('orderNo',
                                                          defaultValue: null,
                                                          valueBuilder:
                                                              (value) {
                                                        if (value == null ||
                                                            value == "null" ||
                                                            value == "") {
                                                          return "No Data Available";
                                                        }
                                                        return value.toString();
                                                      }, label: "Order No"),
                                                      JsonTableColumn(
                                                          'userId.name',
                                                          defaultValue: null,
                                                          label: "Order By"),
                                                      JsonTableColumn(
                                                          'currentState',
                                                          defaultValue: null,
                                                          label:
                                                              "Order Status"),
                                                      JsonTableColumn(
                                                          'next_state_est_time',
                                                          defaultValue: null,
                                                          valueBuilder:
                                                              (value) {
                                                        if (value == "" ||
                                                            value == null ||
                                                            value == "null") {
                                                          return "No Data Available";
                                                        }
                                                        final time =
                                                            DateTime.parse(
                                                                value);
                                                        final deliveryTime =
                                                            DateTime.utc(
                                                                time.year,
                                                                time.month,
                                                                time.day,
                                                                time.hour,
                                                                time.minute,
                                                                time.second);
                                                        final currentTime =
                                                            DateTime.utc(
                                                                DateTime.now()
                                                                    .year,
                                                                DateTime.now()
                                                                    .month,
                                                                DateTime.now()
                                                                    .day,
                                                                DateTime.now()
                                                                    .hour,
                                                                DateTime.now()
                                                                    .minute,
                                                                DateTime.now()
                                                                    .second);
                                                        final leftTime =
                                                            deliveryTime
                                                                .difference(
                                                                    currentTime)
                                                                .inMinutes;
                                                        if (leftTime < 0 ||
                                                            leftTime > 30) {
                                                          return "Over Due";
                                                        } else {
                                                          return (leftTime)
                                                              .toString();
                                                        }
                                                      },
                                                          label:
                                                              "Estimated Time"),
                                                    ]
                                                  : [
                                                      JsonTableColumn(
                                                        'createdDate',
                                                        defaultValue: null,
                                                        label: "Date",
                                                        valueBuilder: (value) {
                                                          final createdDate =
                                                              DateTime.parse(
                                                                  value);
                                                          final utcTime =
                                                              DateTime.utc(
                                                                  createdDate
                                                                      .year,
                                                                  createdDate
                                                                      .month,
                                                                  createdDate
                                                                      .day,
                                                                  createdDate
                                                                      .hour,
                                                                  createdDate
                                                                      .minute,
                                                                  createdDate
                                                                      .second);
                                                          final localTime =
                                                              utcTime.toLocal();
                                                          return "${localTime.day}-${localTime.month}-${localTime.year.toString().substring(2)} ${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
                                                        },
                                                      ),
                                                      JsonTableColumn('orderNo',
                                                          defaultValue: null,
                                                          valueBuilder:
                                                              (value) {
                                                        if (value == null ||
                                                            value == "null" ||
                                                            value == "") {
                                                          return "No Data Available";
                                                        }
                                                        return value.toString();
                                                      }, label: "Order No"),
                                                      JsonTableColumn(
                                                          'userId.name',
                                                          defaultValue: null,
                                                          label: "Order By"),
                                                      JsonTableColumn(
                                                          'currentState',
                                                          defaultValue: null,
                                                          label:
                                                              "Order Status"),
                                                      // JsonTableColumn('orderId',
                                                      //     defaultValue: null,
                                                      //     label: "Order Details"),
                                                    ],
                                              tableHeaderBuilder: (header) {
                                                headerVal = header.toString();
                                                return Container(
                                                  padding: EdgeInsets.all(2.w),
                                                  height: 5.h,
                                                  decoration: BoxDecoration(
                                                    color: tableBlack,
                                                    border: Border.all(
                                                        color: borderWhite),
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Center(
                                                      child: Text(
                                                        header.toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            GoogleFonts.inter(
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
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
                                                    orderETADialog(
                                                        context,
                                                        id,
                                                        "normal",
                                                        map['orderNo']);
                                                    isSelected = false;
                                                    id = '';
                                                  }
                                                }
                                                // else if (tappedIndex == 1) {
                                                //   confirmationDialog(
                                                //       context,
                                                //       "Put Order In Processing",
                                                //       "ORDER_IN_PROGRESS",
                                                //       id,
                                                //       "ORDER_CONFIRMED",
                                                //       "normal");
                                                // }
                                                else if (tappedIndex == 1) {
                                                  confirmationDialog(
                                                      context,
                                                      "Is The Order Brewed",
                                                      "ORDER_READY_FOR_PICKUP",
                                                      id,
                                                      "ORDER_CONFIRMED",
                                                      "normal");
                                                } else if (tappedIndex == 2) {
                                                  confirmationDialog(
                                                      context,
                                                      "Is The Order Delivered? ",
                                                      "ORDER_COMPLETED",
                                                      id,
                                                      "ORDER_READY_FOR_PICKUP",
                                                      "normal");
                                                }
                                              },
                                              rowHighlightColor: Colors
                                                  .yellow[500]!
                                                  .withOpacity(0.5),
                                              tableCellBuilder: (value) {
                                                return Container(
                                                  padding: EdgeInsets.all(2.w),
                                                  height: 5.h,
                                                  decoration: BoxDecoration(
                                                    color: tableBlack,
                                                    border: Border.all(
                                                        color: borderWhite),
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            headerVal ==
                                                                        "Order Details" ||
                                                                    headerVal ==
                                                                        "Order Status"
                                                                ? ""
                                                                : value,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: GoogleFonts.inter(
                                                                textStyle: headerVal == "Order Details"
                                                                    ? const TextStyle(
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      )
                                                                    : null,
                                                                color: headerVal == "Order Details"
                                                                    ? orderDetailsGreen
                                                                    : headerVal == "Order Status"
                                                                        ? value != "Pending" && value != "Cancelled"
                                                                            ? orderDetailsGreen
                                                                            : value == "Pending"
                                                                                ? pending
                                                                                : value == "Cancelled"
                                                                                    ? cancelled
                                                                                    : white
                                                                        : white,
                                                                fontWeight: headerVal == "Order Details"
                                                                    ? FontWeight.w500
                                                                    : headerVal == "Order Status"
                                                                        ? value != "Confirmed"
                                                                            ? FontWeight.w500
                                                                            : FontWeight.w400
                                                                        : FontWeight.w400),
                                                          ),
                                                          headerVal ==
                                                                  "Order Details"
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    // OrderDetailsDialog(
                                                                    //   context,
                                                                    // );
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                        "view More",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .start,
                                                                        style: GoogleFonts.inter(
                                                                            color:
                                                                                borderWhite,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                )
                                                              : const Text(""),
                                                          headerVal ==
                                                                  "Order Status"
                                                              ? Center(
                                                                  child: Text(
                                                                      value.toString().replaceAll(
                                                                          RegExp(
                                                                              r'_'),
                                                                          ' '),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: GoogleFonts.inter(
                                                                          color: headerVal == "Order Status"
                                                                              ? value != "ORDER_READY_FOR_PICKUP" && value != "ORDER_CANCELLED"
                                                                                  ? orderDetailsGreen
                                                                                  : value == "ORDER_READY_FOR_PICKUP"
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
                                                  ),
                                                );
                                              },
                                            ),
                                            JsonTable(
                                              data,
                                              columns: [
                                                JsonTableColumn('orderId',
                                                    defaultValue: null,
                                                    label: "Order Details"),
                                              ],
                                              tableHeaderBuilder: (header) {
                                                headerVal = header.toString();
                                                return Container(
                                                  padding: EdgeInsets.all(2.w),
                                                  height: 5.h,
                                                  decoration: BoxDecoration(
                                                    color: tableBlack,
                                                    border: Border.all(
                                                        color: borderWhite),
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Center(
                                                      child: Text(
                                                        header.toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            GoogleFonts.inter(
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              allowRowHighlight: true,
                                              onRowSelect: (index, map) {
                                                id = map['orderId'];
                                                setState(() {
                                                  isSelect = true;
                                                });
                                                print(id);
                                                if (isSelect == true) {
                                                  context
                                                      .read<OrderHistory>()
                                                      .getOrderhistory(id)
                                                      .then((value) =>
                                                          orderDetailsDialog(
                                                              context, value))
                                                      .whenComplete(() {
                                                    setState(() {
                                                      isSelect = false;
                                                    });
                                                  });
                                                }
                                              },
                                              rowHighlightColor: Colors
                                                  .yellow[500]!
                                                  .withOpacity(0.5),
                                              tableCellBuilder: (value) {
                                                return Container(
                                                  padding: EdgeInsets.all(2.w),
                                                  height: 5.h,
                                                  decoration: BoxDecoration(
                                                    color: tableBlack,
                                                    border: Border.all(
                                                        color: borderWhite),
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Center(
                                                      child: Text(
                                                        "View More",
                                                        style: GoogleFonts.inter(
                                                            color: Colors.white,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                  height: 8.h,
                                )
                              ] else if (tappedIndex > 5 && data != null) ...[
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
              if (isSelect) ...[
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
