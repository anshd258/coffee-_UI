import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/provider/merchantProvider/set_cafe_timings.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:inter_coffee/widgets/dialog_box.dart';
import 'package:provider/provider.dart';
import '../provider/products_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'namebar2.dart';
import 'product_list_lower_list_container.dart';

class ProductListMainContainer extends StatefulWidget {
  const ProductListMainContainer({Key? key}) : super(key: key);

  @override
  State<ProductListMainContainer> createState() =>
      _ProductListMainContainerState();
}

class _ProductListMainContainerState extends State<ProductListMainContainer> {
  //data of the products offerd
  final TextEditingController ctr = TextEditingController();
  bool shopIsClosed = false;
  bool onTap = false;
  String start = "";
  String end = "";
  String message = "";

  void checkIfShopClosed() async {
    // API Call to get closed timings
    await context.read<SetCafeTimings>().getCafeStatus( context );
    shopIsClosed = context.read<SetCafeTimings>().isShopClosed!;
    message = context.read<SetCafeTimings>().message;
  }

  @override
  void initState() {
    getproducts();
    checkIfShopClosed();
    context.read<userDetailsProvider>().getUserDetails( context );
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
    }
  }

  bool isCartNotEmpty() {
    
    if( onTap ) {
      onTap = false;
      return false;
    }
    if( context.watch<CartProductsProvider>().cartData.isNotEmpty ) {
      return true;
    }
    return false;
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
            color: Theme.of(context).secondaryHeaderColor,
            child: const Center(child: name_bar2())),
        // mid container fir the horizontal list of products
        //bottom get it instantly text
        isAdmin
            ? const SizedBox(height: 0,width: 0,)
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
        //lower sized box for the  vertical list of products
        Expanded(
          child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
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
                    : shopIsClosed
                    ? Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 10.h),
                        child: DialogBox(
                          start: "",
                          end: "",
                          message: message.isEmpty ? "Cafe is Closed!" : message,
                        ),
                      )
                    : 
                    Expanded(
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
                // if (isCartNotEmpty())
                //   GestureDetector(
                //     onTap: () {
                //       setState(() {
                //         onTap = true;
                //       });
                //     },
                //     child: GlassContainer.frostedGlass(
                //       height: 100.h,
                //       width: 100.w,
                //       blur: 14,
                //       frostedOpacity: 0.04,
                //       borderRadius: BorderRadius.circular(25),
                //       color: Colors.black26,
                //       child: Container(
                //         alignment: Alignment.topCenter,
                //         padding: EdgeInsets.only(top: 10.h),
                        // child: DialogBox(
                        //   start: "",
                        //   end: "",
                        //   message: "Please Confirm your Order in the Cart",
                        // ),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
