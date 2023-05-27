import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/main.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import 'package:inter_coffee/provider/products_provider.dart';
import 'package:inter_coffee/provider/user_details_provider.dart';
import 'package:inter_coffee/widgets/product_list_lower_list_container.dart';
import 'package:inter_coffee/widgets/order_confirmation_dialog.dart';
import 'package:inter_coffee/widgets/horizontal_product_container.dart';
import 'package:inter_coffee/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateOrderMainContent extends StatefulWidget {
  const CreateOrderMainContent({super.key});

  @override
  State<CreateOrderMainContent> createState() => _CreateOrderMainContentState();
}

class _CreateOrderMainContentState extends State<CreateOrderMainContent> {
  //data of the products offered
  String? nameEntered;
  String? contactNoEntered;
  final TextEditingController ctr = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController contactNo = TextEditingController();

  @override
  void initState() {
    getproducts();
    context.read<userDetailsProvider>().getUserDetails(context);
    ctr.addListener(() {
      context.read<ProductsProvider>().searchData(ctr.text);
    });
    super.initState();
  }

  void getproducts() async {
    final response = await context.read<ProductsProvider>().getproducts();
  }

  double widthButton = 38.w;
  bool checknox = false;
  @override
  Widget build(BuildContext context) {
    name.text = nameEntered != null ? nameEntered! : "";
    contactNo.text = contactNoEntered != null ? contactNoEntered! : "";

    final data = context.watch<ProductsProvider>().productslist;
    final List<CartModal> productsInfo =
        context.watch<CartProductsProvider>().cartData;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                  padding: EdgeInsets.only(left: 10.w),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Name",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontSize: 16)),
                      TextSpan(
                          text: "*",
                          style: GoogleFonts.inter(
                              color: Colors.red, fontSize: 16)),
                    ]),
                  ),
                ),
                Center(
                  child: TextField(
                    controller: name,
                    style: GoogleFonts.inter(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: GoogleFonts.inter(color: Colors.white),
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
                      constraints:
                          BoxConstraints(maxHeight: 5.h, maxWidth: 80.w),
                    ),
                    onChanged: (value) {
                      nameEntered = value;
                    },
                    onSubmitted: (value) {
                      nameEntered = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 10.w),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Contact",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontSize: 16)),
                      TextSpan(
                          text: "*",
                          style: GoogleFonts.inter(
                              color: Colors.red, fontSize: 16)),
                    ]),
                  ),
                ),
                Center(
                  child: TextField(
                    controller: contactNo,
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.inter(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "Enter 10 digit Contact Number",
                      hintStyle: GoogleFonts.inter(color: Colors.white),
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
                      constraints:
                          BoxConstraints(maxHeight: 5.h, maxWidth: 80.w),
                    ),
                    onChanged: (value) {
                      contactNoEntered = value;
                    },
                    onSubmitted: (value) {
                      contactNoEntered = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "   Cart",
                        style: GoogleFonts.inter(
                          fontSize: 17.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                          color: titleUserList,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: productsInfo.isNotEmpty
                            ? Row(
                                children: productsInfo
                                    .map((e) => HorizontalProductContainer(
                                          e: e,
                                        ))
                                    .toList())
                            : Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "           Add Something To Order 😋",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70),
                                ),
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: widthButton,
                          child: ElevatedButton(
                            onPressed: () {
                              if (productsInfo.isNotEmpty &&
                                  name.text.trim().isNotEmpty &&
                                  contactNo.text.trim().isNotEmpty) {
                                if (contactNo.text.length > 10) {
                                  snakbarmethod(context,
                                      "Enter a Phone Number not greater than 10 digits");
                                } else if (contactNo.text.length < 10) {
                                  snakbarmethod(context,
                                      "Enter a Phone Number not smaller than 10 digits");
                                } else {
                                  context
                                      .read<CartProductsProvider>()
                                      .merchantPostData(
                                          context,
                                          name.text.trim(),
                                          contactNo.text.trim());
                                  orderConfirmationDialog(context,
                                      "Order Completed Successfully !", 1);
                                }
                              } else if (name.text.isEmpty ||
                                  contactNo.text.isEmpty) {
                                snakbarmethod(
                                    context, 'please fill the name & contact');
                              } else {
                                snakbarmethod(
                                    context, 'please add products to cart');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(widthButton, 5.h),
                                elevation: 5,
                                backgroundColor: Colors.greenAccent.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7))),
                            child: Text(
                              "Place Order",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16.5.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.h),

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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white70)),
                            )
                          : Padding(
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
