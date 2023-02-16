import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/add_product_to_cart.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:provider/provider.dart';
import '../provider/cartProductProvider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/OC_pg_list.dart';
import '../widgets/orderconfirmationDialog.dart';

class Orderconfirmationpg extends StatefulWidget {
  const Orderconfirmationpg({super.key});
  // final List<AddProductToCart> listCartData;

  @override
  State<Orderconfirmationpg> createState() => _OrderconfirmationpgState();
}

class _OrderconfirmationpgState extends State<Orderconfirmationpg> {
  @override
  void initState() {
    // productsInfo = context.read<CartProductsProvider>().cartData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CartModal> productsInfo =
        context.watch<CartProductsProvider>().cartData;
    // productsInfo.add(CartProductsModal().toJson());
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
            end: Alignment.bottomCenter),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 6.w,
            leading: SizedBox(width: 1.w),
            title: Text("Swift Café ",
                textAlign: TextAlign.start,
                style:
                    GoogleFonts.inter(color: titleStatusBar, fontSize: 18.sp)),
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
                      children: productsInfo.isEmpty
                          ? [
                              Container(
                                  width: 100.w,
                                  height: 90.h,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Add Something To Order 😋",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white70),
                                  )),
                            ]
                          : productsInfo.map((e) {
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
                        context.read<CartProductsProvider>().postData();
                        OrderConfirmatonDilog(context);
                        // context.read<CartProductsProvider>().clearCart();
                        // setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(50.w, 4.5.h),
                          backgroundColor: Colors.greenAccent.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))),
                      child: Text(
                        "Confirm and Place Order",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 16.sp),
                      ),
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
