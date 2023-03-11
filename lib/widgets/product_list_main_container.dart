import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:provider/provider.dart';
import '../provider/productsprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'namebar2.dart';
import 'product_list_lower_list_container.dart';
import 'Admin/login_expired_dialog.dart';

class ProductListMainContainer extends StatefulWidget {
  const ProductListMainContainer({super.key});

  @override
  State<ProductListMainContainer> createState() =>
      _ProductListMainContainerState();
}

class _ProductListMainContainerState extends State<ProductListMainContainer> {
  //data of the products offerd
  final TextEditingController ctr = TextEditingController();
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
      Navigator.pushNamedAndRemoveUntil(context, switcher, (route) => false);
      tokenExpiredDialog(context, "Login Has Expired Please login Again");
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductsProvider>().productslist;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //namebar with name date delete icon and profie image
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            color: nameBar,
            child: const Center(child: name_bar2())),
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
                  ],
                ),
              ),
        SizedBox(
          height: 1.3.h,
        ),
        // mid container fir the horizontal list of products
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
        Expanded(
          child: Container(
            width: 100.w,
            decoration: BoxDecoration(
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
                    : Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: data.map((e) {
                              return ProductListScreenLowerListContainer(
                                e: e,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
