import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:sizer/sizer.dart';

class Pg2BottonavBar extends StatefulWidget {
  const Pg2BottonavBar({super.key});

  @override
  State<Pg2BottonavBar> createState() => _Pg2BottonavBarState();
}

class _Pg2BottonavBarState extends State<Pg2BottonavBar> {
  //for managing the state

  int val = 1;

  //bool value for indicating is that pagee on scree

  bool page1 = true;
  bool page2 = false;
  bool page3 = false;
  bool page4 = false;
  bool page5 = false;
  @override
  Widget build(BuildContext context) {
    //switch case for bottom navigaton bar

    switch (val) {
      case 1:
        {
          page1 = true;
          page2 = false;
          page3 = false;
          page4 = false;
          page5 = false;
        }
        break;
      case 2:
        {
          page1 = false;
          page2 = true;
          page3 = false;
          page4 = false;
          page5 = false;
        }
        break;
      case 3:
        {
          page1 = false;
          page2 = false;
          page3 = true;
          page4 = false;
          page5 = false;
        }
        break;
      case 4:
        {
          page1 = false;
          page2 = false;
          page3 = false;
          page4 = true;
          page5 = false;
        }
        break;
      case 5:
        {
          page1 = false;
          page2 = false;
          page3 = false;
          page4 = false;
          page5 = true;
        }
        break;
      default:
    }

    return GlassContainer.clearGlass(
      margin: const EdgeInsets.all(20),
      height: 6.5.h,
      width: 90.w,
      blur: 15,
      alignment: Alignment.center,
      color: Colors.black54,
      borderRadius: const BorderRadius.all(
        Radius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4.5.h,
            width: 10.w,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: page1 ? Colors.black38 : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.4,
                  color: page1 ? Colors.white : Colors.transparent,
                )),
            child: IconButton(
                constraints: BoxConstraints(
                    maxHeight: 4.h,
                    maxWidth: 9.w,
                    minHeight: 4.h,
                    minWidth: 9.w),
                alignment: Alignment.center,
                onPressed: () {
                  setState(() {
                    val = 1;
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 6.w,
                )),
          ),
          Container(
            height: 4.5.h,
            width: 10.w,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: page2 ? Colors.black38 : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.4,
                  color: page2 ? Colors.white : Colors.transparent,
                )),
            child: IconButton(
                constraints: BoxConstraints(
                    maxHeight: 4.h,
                    maxWidth: 9.w,
                    minHeight: 4.h,
                    minWidth: 9.w),
                alignment: Alignment.center,
                onPressed: () {
                  setState(() {
                    val = 2;
                  });
                },
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.white,
                  size: 6.w,
                )),
          ),
          Container(
            height: 4.5.h,
            width: 10.w,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: page3 ? Colors.black38 : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.4,
                  color: page3 ? Colors.white : Colors.transparent,
                )),
            child: IconButton(
                constraints: BoxConstraints(
                    maxHeight: 4.h,
                    maxWidth: 9.w,
                    minHeight: 4.h,
                    minWidth: 9.w),
                alignment: Alignment.center,
                onPressed: () {
                  setState(() {
                    val = 3;
                  });
                },
                icon: Icon(
                  Icons.wallet_outlined,
                  color: Colors.white,
                  size: 6.w,
                )),
          ),
          Container(
            height: 4.5.h,
            width: 10.w,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: page4 ? Colors.black38 : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.4,
                  color: page4 ? Colors.white : Colors.transparent,
                )),
            child: IconButton(
                constraints: BoxConstraints(
                    maxHeight: 4.h,
                    maxWidth: 9.w,
                    minHeight: 4.h,
                    minWidth: 9.w),
                alignment: Alignment.center,
                onPressed: () {
                  setState(() {
                    val = 4;
                  });
                },
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.white,
                  size: 6.w,
                )),
          ),
          Container(
            height: 4.5.h,
            width: 10.w,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: page5 ? Colors.black38 : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.4,
                  color: page5 ? Colors.white : Colors.transparent,
                )),
            child: IconButton(
                constraints: BoxConstraints(
                    maxHeight: 4.h,
                    maxWidth: 9.w,
                    minHeight: 4.h,
                    minWidth: 9.w),
                alignment: Alignment.center,
                onPressed: () {
                  val = 5;

                  print("object");
                  setState(() {});
                },
                icon: Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                  size: 6.w,
                )),
          ),
        ],
      ),
    );
  }
}
