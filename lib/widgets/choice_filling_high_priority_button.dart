import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/widgets/snackbar.dart';
import 'package:inter_coffee/provider/cart_product_provider.dart';
import '../models/products_list_model.dart';
import 'package:provider/provider.dart';
import '../provider/login_auth_provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChoiceFillingHighPriorityButton extends StatefulWidget {
  final ProductList selectedproduct;
  const ChoiceFillingHighPriorityButton(
      {super.key, required this.selectedproduct});

  @override
  State<ChoiceFillingHighPriorityButton> createState() =>
      _ChoiceFillingHighPriorityButtonState();
}

class _ChoiceFillingHighPriorityButtonState
    extends State<ChoiceFillingHighPriorityButton> {
  @override
  Widget build(BuildContext context) {
    final currentcChoices = context.watch<CartProductsProvider>().currentChoie;
    final checkerlength = context.watch<CartProductsProvider>().checkerLength;

    final role = context.watch<LoginAuthProvider>().role;

    double width = 80.w;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //submit elevated button
        ElevatedButton(
          onPressed: () {
            if (currentcChoices.isNotEmpty &&
                currentcChoices.length == checkerlength) {
              Provider.of<CartProductsProvider>(context, listen: false)
                  .setCartData();
              Provider.of<CartProductsProvider>(context, listen: false)
                  .submit();
              // orderConfirmationDialog(context, "Order Added to Cart !", 1);
              snakbarmethod(context, "Order Added to Cart !");
              Navigator.pop(context);
            } else {
              snakbarmethod(context, "Please Select All The Choices");
            }
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(width, 5.h),
              elevation: 5,
              backgroundColor: Colors.greenAccent.shade700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          child: Text(
            "Submit",
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16.5.sp,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
