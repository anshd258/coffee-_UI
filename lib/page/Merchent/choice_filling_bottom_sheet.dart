import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/models/products_list_model.dart';
import 'package:inter_coffee/page/ProductList/product_list_all_details.dart';
import 'package:inter_coffee/provider/cartProductProvider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class ChoiceFillingMerchantBottomSheet extends StatefulWidget {
  final ProductList data;
  const ChoiceFillingMerchantBottomSheet({super.key, required this.data});

  @override
  State<ChoiceFillingMerchantBottomSheet> createState() =>
      _ChoiceFillingMerchantBottomSheetState();
}

class _ChoiceFillingMerchantBottomSheetState
    extends State<ChoiceFillingMerchantBottomSheet> {
  //dropdown meenue state
  var dropdownvalue = 1;
  @override
  void initState() {
    context.read<CartProductsProvider>().currentproduct.quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.watch<CartProductsProvider>().currentproduct.quantity);
    final ProductList productsList =
        ModalRoute.of(context)?.settings.arguments as ProductList;

    id = widget.data.id!;
    name = widget.data.name!;
    discription = widget.data.description!;
    ratings = "4.9";
    price = "100";
    numberOfReviews = "375";
    imageUrl = widget.data.img!;
    quantity = "1";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //main glasscontainer
        GlassContainer.frostedGlass(
          height: (50 + productsList.choice!.length * 25).h,
          width: 100.w,
          blur: 20,
          frostedOpacity: 0.00,
          color: const Color.fromARGB(25, 189, 189, 189),
          borderColor: Colors.transparent,
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30), bottom: Radius.zero),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // for padding
              SizedBox(
                height: 8.h,
              ),

              Expanded(
                child: AllProductPropertiesRender(
                    choices: productsList.choice),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
