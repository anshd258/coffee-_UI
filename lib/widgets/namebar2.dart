import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/user_details_model.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class name_bar2 extends StatelessWidget {
  const name_bar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetails>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
              child: SizedBox(
                width: 90.w,
                // padding: EdgeInsets.symmetric(horizontal: 5.w),
                // alignment: Alignment.topLeft,
                // padding: isAdmin ? EdgeInsets.symmetric( vertical: 1.h, horizontal: 5.w ) : EdgeInsets.symmetric(horizontal: 5.w),
                // color: nameBar,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("👋", style: TextStyle(fontSize: 18.sp)),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                style: GoogleFonts.inter(
                                    color: nameAndDateInNameBar,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Text(
                                snapshot.data!.name.toString(),
                                style: GoogleFonts.inter(
                                    // color: Color.fromARGB(255, 182, 182, 182),
                                    color: nameAndDateInNameBar,
                                    fontSize: 17.sp),
                              )
                            ],
                          ),
                        ]),
                    Container(
                      height: 6.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                              width: 0.5, color: Colors.green.shade400),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/user.jpeg",
                              ))),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white70)),
            );
          }
        });
  }
}
