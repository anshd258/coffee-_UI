import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:inter_coffee/models/order_prouct.dart';

import 'package:inter_coffee/provider/cartProductProvider.dart';
import '../models/products_list_model.dart';
import 'package:provider/provider.dart';
import '../provider/loginAuthProvider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Pg3highPrioButton extends StatefulWidget {
  final ProductList selectedproduct;
  const Pg3highPrioButton({super.key, required this.selectedproduct});

  @override
  State<Pg3highPrioButton> createState() => _Pg3highPrioButtonState();
}

class _Pg3highPrioButtonState extends State<Pg3highPrioButton> {
  bool checknox = false;

  @override
  Widget build(BuildContext context) {
    final role = context.watch<LoginAuthProvider>().role;
    // final choiceofmilk = context.watch<currentcartdata>().CM;
    // final choiceofsuger = context.watch<currentcartdata>().CS;
    // final choiceoffilling = context.watch<currentcartdata>().cFF;
    // final quant = context.watch<currentcartdata>().quantit;
    // final id = context.watch<currentcartdata>().identi;
    var data = context.watch<CartProductsProvider>().currentproduct;

    void display() {
      // data.id = widget.selectedproduct.id;
      // data.name = widget.selectedproduct.name;

      // data.discription = widget.selectedproduct.description;
      // data.imageUrl = widget.selectedproduct.img;

      print(data.toJson());
    }

    double width = 32.5.w;
    if (role != "admin") {
      width = 80.w;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: role == "admin"
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
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
            // display();
            // Navigator.pop(context);
            context.read<CartProductsProvider>().AddingProductsToCart(
                    orderProduct(productId: "latte", quantity: 2, choice: [
                  Choice(name: 'eta', choices: ["10"]),
                  Choice(name: 'syrup', choices: ["vannila", "choco"])
                ]));
            Navigator.pop(context);
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
