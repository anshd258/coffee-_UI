import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Container rowContainer(int index, int tappedIndex, List<String> filterList) {
    return Container(
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
                                      );
  }