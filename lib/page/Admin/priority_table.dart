import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/cancellation_reason_list.dart';
import 'package:inter_coffee/provider/merchantProvider/table_priority_provider.dart';

import 'package:inter_coffee/provider/reports_provider.dart';
import 'package:inter_coffee/widgets/Admin/admin_report_datetime_widgte.dart';
import 'package:inter_coffee/widgets/Admin/date_time_picker_method.dart';
import 'package:inter_coffee/widgets/Admin/jsontable_column_builder_without_time.dart';
import 'package:inter_coffee/widgets/Admin/jsontable_column_builder_with_timme.dart';
import 'package:inter_coffee/widgets/Admin/no_data_container.dart';
import 'package:inter_coffee/widgets/Merchant/table_cell_builder.dart';
import 'package:inter_coffee/widgets/Merchant/header_container.dart';
import 'package:inter_coffee/widgets/Merchant/merchant_create_order_widget.dart';
import 'package:inter_coffee/widgets/Merchant/on_row_select_viewmore_method.dart';
import 'package:inter_coffee/widgets/Merchant/order_table_row_select.dart';
import 'package:inter_coffee/widgets/Merchant/order_state_setter-method.dart';
import 'package:inter_coffee/widgets/Merchant/order_table_row_selection.dart';
import 'package:inter_coffee/widgets/Merchant/view_more_container.dart';
import 'package:inter_coffee/widgets/Merchant/view_more_widget.dart';
import 'package:inter_coffee/widgets/loader_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../widgets/Admin/reports_table.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';

import 'package:json_table/json_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PriorityTable extends StatefulWidget {
  const PriorityTable({super.key});

  @override
  State<PriorityTable> createState() => _PriorityTableState();
}

class _PriorityTableState extends State<PriorityTable> {
  @override
  void initState() {
    context.read<TablePriorityProvider>().getOrders("ORDER_PLACED");
    context.read<CancellationReasonList>().getReasons( context );
    super.initState();
  }

  void setTappedIndex(int index) {
    setState(() {
      tappedIndex = index;
    });
  }

  void setLoader() {
    setState(() {
      isSelect = true;
    });
  }

  void setloaderfalse() {
    setState(() {
      isSelect = false;
    });
  }

  String fromdate = "DD/MM/YYYY";
  String todate = "DD/MM/YYYY";
  int tappedIndex = 0;
  void setid(String Id) {
    id = Id;
  }

  List<String> filterList = [
    "New Orders",
    "Order Confirmed",
    // "Orders Progress",
    "Order Ready for Pick Up",
    "Completed Orders",
    "Cancelled"
  ];
  bool isSelected = false;
  bool isSelect = false;
  String id = "";
  void setIdNull() {
    id = "";
  }

  void toDateSetter(DateTime time) {
    setState(() {
      todate = DateFormat("yyyy-MM-dd").format(time);
      // "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
      context
          .read<ReportsProvider>()
          .fetchReports(context, fromdate.toString(), todate.toString());
    });
  }

  void fromDateSetter(DateTime time) {
    setState(() {
      fromdate = DateFormat("yyyy-MM-dd").format(time);
      // "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;

    final List<dynamic>? data =
        context.watch<TablePriorityProvider>().orderJsonTableData;

    String headerVal = "";
    // var json = jsonDecode(json1);
    // List<dynamic> callRightJSON(ta8ppedIndex) {
    //   switch (tappedIndex) {
    //     case 0:
    //       json = jsonDecode(json1);
    //       break;
    //     case 1:
    //       json = jsonDecode(json2);
    //       break;
    //     case 2:
    //       json = jsonDecode(json3);
    //       break;

    //     default:
    //       json = jsonDecode(json1);
    //       break;
    //   }
    //   return json;
    // }

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
                                const merchant_create_order_widget(),
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
                                          orderTableRowSelection(
                                              index, context, setTappedIndex);
                                          // setTappedIndex(index);
                                          // json = jsonDecode(json4);
                                        },
                                        child: rowContainer(
                                            index, tappedIndex, filterList),
                                      );
                                    },
                                  ),
                                ),
                              ],
                              SizedBox(
                                height: 2.h,
                              ),
                              if (role == 'admin') ...[
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
                                        // dateTimeMethod(context, fromDateSetter);
                                        BottomPicker.date(
                                          title: "Select Date",
                                          titleStyle: const TextStyle(
                                            color: Colors.white
                                          ),
                                          descriptionStyle: const TextStyle(
                                            color: Colors.white
                                          ),
                                          closeIconColor: Colors.white,
                                          pickerTextStyle: const TextStyle(fontSize: 14, color: Colors.white),
                                          buttonSingleColor: Colors.greenAccent.shade700,
                                          onSubmit: ( date ) {
                                            fromDateSetter(date);
                                          },
                                          backgroundColor: Colors.brown.shade900,
                                        ).show(context);
                                      },
                                      child: DateDisplayAdminReports(
                                          fromdate: fromdate),
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
                                        // dateTimeMethod(context, toDateSetter);
                                        BottomPicker.date(
                                          title: "Select Date",
                                          titleStyle: const TextStyle(
                                            color: Colors.white
                                          ),
                                          descriptionStyle: const TextStyle(
                                            color: Colors.white
                                          ),
                                          closeIconColor: Colors.white,
                                          pickerTextStyle: const TextStyle(fontSize: 14, color: Colors.white),
                                          buttonSingleColor: Colors.greenAccent.shade700,
                                          onSubmit: ( date ) {
                                            toDateSetter(date);
                                          },
                                          backgroundColor: Colors.brown.shade900,
                                        ).show(context);
                                      },
                                      child: DateDisplayAdminReports(
                                          fromdate: todate),
                                    )
                                  ],
                                )
                              ],
                              SizedBox(
                                height: 2.h,
                              ),
                              if (role == 'merchant' && data != null) ...[
                                if (data.isEmpty)
                                  const NoDataContainer()
                                else
                                  SingleChildScrollView(
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
                                              ? JsonTableColumnBuilder
                                              : jsonTableColumnBuilderWithtime,
                                          tableHeaderBuilder: (header) {
                                            headerVal = header.toString();
                                            return headerContainer(header);
                                          },
                                          allowRowHighlight: true,
                                          onRowSelect: (index, map) {
                                            orderStateMethod(
                                                map,
                                                context,
                                                setLoader,
                                                setloaderfalse,
                                                isSelected,
                                                id,
                                                setid,
                                                tappedIndex,
                                                setIdNull);
                                          },
                                          rowHighlightColor: Colors.yellow[500]!
                                              .withOpacity(0.5),
                                          tableCellBuilder: (value) {
                                            return tableCellBuilder(
                                                headerVal, value);
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
                                            return viewMoreContainer(header);
                                          },
                                          allowRowHighlight: true,
                                          onRowSelect: (index, map) {
                                            onRowSelectViewMore(
                                                map,
                                                context,
                                                setLoader,
                                                setloaderfalse,
                                                isSelect);
                                          },
                                          rowHighlightColor: Colors.yellow[500]!
                                              .withOpacity(0.5),
                                          tableCellBuilder: (value) {
                                            return const ViewMoreWidget();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(
                                  height: 8.h,
                                )
                              ] else if (role == 'admin' && data != null) ...[
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
              if (isSelect) ...[const loaderWidget()]
            ],
          ),
        ),
      ),
    );
  }
}
