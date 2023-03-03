import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:inter_coffee/provider/productsprovider.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:inter_coffee/widgets/Admin/loginExpiredDialog.dart';
import 'package:inter_coffee/widgets/Pg2-lower-list-cont.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateOrderMainContent extends StatefulWidget {
  const CreateOrderMainContent({super.key});

  @override
  State<CreateOrderMainContent> createState() => _CreateOrderMainContentState();
}

class _CreateOrderMainContentState extends State<CreateOrderMainContent> {
  //data of the products offerd
  final TextEditingController ctr = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController contactNo = TextEditingController();
  @override
  void initState() {
    getproducts();
    context.read<userDetailsProvider>().getUserDetails();
    ctr.addListener(() {
      context.read<ProductsProvider>().searchData(ctr.text);
    });
    super.initState();
  }

  void getproducts() async {
    final response = await context.read<ProductsProvider>().getproducts();
    if (response == "token expired") {
      context.read<LoginAuthProvider>().logout();
      Navigator.pushNamedAndRemoveUntil(context, "/switcher", (route) => false);
      tokkenExpiredDialog(context, "Login Has Expired Please login Again");
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductsProvider>().productslist;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //for padding
        isAdmin
            ? GlassContainer.frostedGlass(
                height: 9.5.h,
                width: 100.w,
                borderColor: Colors.transparent,
                gradient: LinearGradient(
                    colors: searchBarBG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderWidth: 0.0,
                blur: isAdmin ? 15 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: ctr,
                      cursorColor: const Color.fromARGB(255, 182, 182, 182),
                      decoration: InputDecoration(
                          hintText: "Search favorite Beverages",
                          hintStyle: GoogleFonts.inter(
                            color: const Color.fromARGB(100, 182, 182, 182),
                            fontSize: 12,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune_rounded,
                            color: Color.fromARGB(255, 182, 182, 182),
                          ),
                          prefixIcon: const Icon(Icons.search,
                              color: Color.fromARGB(255, 182, 182, 182)),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          fillColor: Colors.white,
                          constraints: BoxConstraints(
                            maxWidth: 90.w,
                            maxHeight: 5.5.h,
                          )),
                    ),
                    //for gapping
                    // SizedBox(
                    //   height: 1.3.h,
                    // ),
                  ],
                ),
              )
            : SizedBox(
                height: 9.5.h,
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //textfield for searcching
                    TextField(
                      controller: ctr,
                      cursorColor: const Color.fromARGB(255, 182, 182, 182),
                      decoration: InputDecoration(
                          hintText: "Search favorite Beverages",
                          hintStyle: GoogleFonts.inter(
                            color: const Color.fromARGB(100, 182, 182, 182),
                            fontSize: 12,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune_rounded,
                            color: Color.fromARGB(255, 182, 182, 182),
                          ),
                          prefixIcon: const Icon(Icons.search,
                              color: Color.fromARGB(255, 182, 182, 182)),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          fillColor: Colors.white,
                          constraints: BoxConstraints(
                            maxWidth: 90.w,
                            maxHeight: 5.5.h,
                          )),
                    ),
                    //for gapping
                    // SizedBox(
                    //   height: 1.3.h,
                    // ),
                  ],
                ),
              ),
        // mid container fir the horizontal list of products
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only( left: 10.w ),
                  child: const Text("Name :", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                Center(
                  child: TextField(
                    controller: name,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      fillColor: Colors.transparent,
                      filled: true,
                      constraints: BoxConstraints(maxHeight: 5.h, maxWidth: 80.w),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only( left: 10.w ),
                  child: const Text("Contact :", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                Center(
                  child: TextField(
                    controller: contactNo,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      fillColor: Colors.transparent,
                      filled: true,
                      constraints: BoxConstraints(maxHeight: 5.h, maxWidth: 80.w),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
            
            //bottom get it instently text
            isAdmin
                ? const SizedBox(
                    height: 0,
                    width: 0,
                  )
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   Get it instantly",
                      style: GoogleFonts.inter(
                        fontSize: 17.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: titleUserList,
                      ),
                    ),
                  ),
            //for padding
            SizedBox(
              height: 1.8.h,
            ),
            //lower sized box for the  verticallist of products
            Container(
              width: 100.w,
              decoration: BoxDecoration(
                // change the color here to change it to white
                // color: Color.fromARGB(60, 0, 0, 0),
                color: userListBG,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  isAdmin
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "   Get it instantly",
                            style: GoogleFonts.inter(
                              fontSize: 17.sp,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: titleUserList,
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  data.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white70)),
                        )
                      : Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: data.map((e) {
                              return PgLowerListCont(
                                e: e,
                              );
                            }).toList(),
                          ),
                        ),
                ],
              ),
            )
                ],
              ),
          ),
        )
    ],
    );
  }
}
