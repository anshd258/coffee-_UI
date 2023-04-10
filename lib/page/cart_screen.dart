import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/login_auth_provider.dart';
import 'package:inter_coffee/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import '../provider/cart_product_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/cart_product_list.dart';
import '../widgets/order_confirmation_dialog.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  // final List<AddProductToCart> listCartData;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // productsInfo = context.read<CartProductsProvider>().cartData;
    super.initState();
  }

  bool checknox = false;
  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    final List<CartModal> productsInfo =
        context.watch<CartProductsProvider>().cartData;
    // productsInfo.add(CartProductsModal().toJson());
    double width = 32.5.w;
    if (role != "admin") {
      width = 80.w;
    }
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
                style: GoogleFonts.inter(
                    color: Theme.of(context).navigationBarTheme.backgroundColor,
                    fontSize: 18.sp)),
            backgroundColor:
                Theme.of(context).navigationBarTheme.surfaceTintColor,
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
                              return CartProductList(e: e);
                            }).toList(),
                    ),
                  ),
                ),
                Positioned(
                  left: 5.w,
                  right: 5.w,
                  bottom: 10.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //checkbox for selection of high priority
                      if (role == "admin") ...[
                        Row(children: [
                          Checkbox(
                              checkColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              activeColor: Colors.greenAccent.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              value: checknox,
                              onChanged: (onChanged) {
                                setState(() {
                                  checknox = onChanged!;
                                });
                              }),
                          //text of high prioriity
                          Text(
                            "High Priority",
                            style: GoogleFonts.inter(
                              color: const Color.fromRGBO(205, 205, 205, 1),
                              fontSize: 14,
                            ),
                          ),
                          //for padding
                          SizedBox(
                            width: 2.w,
                          ),
                          //for padding
                          Image.asset("assets/8.png"),
                        ]),
                      ],
                      //image ofurgent symbol],),

                      //submit elevated button
                      ElevatedButton(
                        onPressed: () {
                          if (productsInfo.isNotEmpty) {
                            context
                                .read<CartProductsProvider>()
                                .postData(checknox);
                            orderConfirmationDialog(
                                context, "Order Completed Successfully !", 1);
                          } else {
                            snakbarmethod(
                                context, 'Please add products to cart');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 5.h),
                            elevation: 5,
                            backgroundColor: Colors.greenAccent.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        child: Text(
                          "Confirm",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
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
