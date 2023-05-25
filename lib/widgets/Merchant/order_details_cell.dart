import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/order_history_model.dart';
import 'package:inter_coffee/provider/order_history_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailsValueBuilder extends StatefulWidget {
  final String ? id;
  const OrderDetailsValueBuilder({super.key, required this.id });

  @override
  State<OrderDetailsValueBuilder> createState() => _OrderDetailsValueBuilderState();
}

class _OrderDetailsValueBuilderState extends State<OrderDetailsValueBuilder> {
  List<Items> itemList = <Items>[];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() async {
    itemList = await context.read<OrderHistory>().getOrderDetailsForCell( context, widget.id.toString() ).whenComplete((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(2.w),
      height: 20.h,
      decoration: BoxDecoration(
        color: tableBlack,
        border: Border.all(
            color: borderWhite),
      ),
      child: itemList.isNotEmpty 
      ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: itemList
              .map((e) => Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${e.productName} X ${e.quantity}",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: e.choice!
                            .map((em) => Text(
                                  "${em.name} - ${em.choice.toString()}",
                                  textAlign:
                                      TextAlign.left,
                                  style:
                                      GoogleFonts.inter(
                                          color: Colors
                                              .white60,
                                          fontSize: 16.sp,
                                          fontWeight:
                                              FontWeight
                                                  .w400),
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 0.5.h,)
                    ],
                  ))
              .toList(),
        ),
      ) : Center(
        child: SizedBox(
          height: 5.h,
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}