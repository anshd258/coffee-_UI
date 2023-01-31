import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/OC_pg_list.dart';

class Orderconfirmationpg extends StatefulWidget {
  const Orderconfirmationpg({super.key});

  @override
  State<Orderconfirmationpg> createState() => _OrderconfirmationpgState();
}

class _OrderconfirmationpgState extends State<Orderconfirmationpg> {
  List productsInfo = [
    {
      "name": "Hot Cappuccino",
      "rating": "4.9",
      "noreviews": "(456)",
      "image": "assets/3.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
    {
      "name": "Lattè",
      "rating": "4.5",
      "noreviews": "(896)",
      "image": "assets/2.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
    {
      "name": "Flate White",
      "rating": "4.9",
      "noreviews": "(626)",
      "image": "assets/4.png",
      "type": "Espresso, Steamed Milk",
      "discription":
          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bg1.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.frostedGlass(
        height: 100.h,
        width: 100.w,
        borderWidth: 0,
        blur: 17,
        frostedOpacity: 0.04,
        gradient: LinearGradient(
          colors: allScreenBGGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 6.w,
            leading: SizedBox(width: 1.w),
            title: Text("Swift Café ",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(color: titleStatusBar, fontSize: 18.sp)),
            backgroundColor: bgStatusBar,
          ),
          body: Center(
            child: Stack(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 90.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: productsInfo.map((e) {
                        return OcpageList(e: e);
                      }).toList(),
                    ),
                  ),
                ),
                Positioned(
                  left: 5.w,
                  right: 5.w,
                  bottom: 10.h,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/orderdetailsPg");
                      },
                      child: Text(
                        "Confirm and Place Order",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 16.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(50.w, 4.5.h),
                          backgroundColor: Colors.greenAccent.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
