import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DropDownSelection extends StatefulWidget {
  final List<String> list;
  const DropDownSelection({super.key, required this.list});

  @override
  State<DropDownSelection> createState() => _DropDownSelectionState();
}

class _DropDownSelectionState extends State<DropDownSelection> {
  @override
  Widget build(BuildContext context) {
    String selecteditem = widget.list[0];
    List<String> mainList = widget.list;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
      width: 60.w,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          items: mainList
              .map((e) => DropdownMenuItem<String>(
                    alignment: Alignment.centerLeft,
                    value: e.toString(),
                    child: Text(
                      e,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 197, 197, 197),
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ))
              .toList(),
          value: selecteditem,
          icon: Container(
            height: 5.h,
            width: 10.w,
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4))),
            child: const Icon(
              Icons.arrow_drop_down,
            ),
          ),
          iconSize: 25.sp,
          iconOnClick: Container(
            height: 5.h,
            width: 10.w,
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4))),
            child: const Icon(Icons.arrow_drop_up),
          ),
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.grey,
          buttonHeight: 5.5.h,
          buttonWidth: 50.w,
          buttonPadding: EdgeInsets.only(left: 5.w, right: 0.3.w),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey.shade700,
            ),
            color: Colors.grey.shade700,
          ),
          buttonElevation: 2,
          itemHeight: 5.h,
          itemPadding: EdgeInsets.only(left: 4.w, right: 4.w),
          dropdownMaxHeight: 50.w,
          dropdownWidth: 50.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black54,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(0, 0),
          onChanged: (value) {
            selecteditem = value.toString();
            setState(() {
              selecteditem = value as String;
            });
          },
        ),
      ),
    );
  }
}
