import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Container tableCellBuilder(String headerVal, value) {
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
                                                                      TextDecoration
                                                                          .underline,
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
                                                                          TextDecoration
                                                                              .underline,
                                                                      fontWeight:
                                                                          FontWeight.w500)),
                                                            ),
                                                          )
                                                        : const Text(""),
                                                    headerVal ==
                                                            "Order Status"
                                                        ? Center(
                                                            child: Text(
                                                                value
                                                                    .toString()
                                                                    .replaceAll(
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
  }