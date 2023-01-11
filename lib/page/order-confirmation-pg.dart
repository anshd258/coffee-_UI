import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: GlassContainer.clearGlass(
        blur: 10,
        height: 100.h,
        width: 100.w,
        borderWidth: 0,
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 14.w,
            title: Text("Swift Café ",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 1.7.h)),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
            ),
            backgroundColor: Colors.white24,
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
                  bottom: 3.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/orderdetailsPg");
                    },
                    child: Text(
                      "Confirm and Place Order",
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(68.w, 4.h),
                        backgroundColor: Colors.greenAccent.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
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
