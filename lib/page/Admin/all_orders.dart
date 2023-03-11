import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/models/order_details_model.dart';
import 'package:inter_coffee/provider/OrderHistoryProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widgets/Admin/merchant_homescreen_row_container.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final dataLoading = context.watch<OrderHistory>().dataLoading;
    final List products = [
      {
        "productid": 0123,
        "name": "latte",
        "quantity": 2,
        "choices": ["full", "2 X suger", "2 x choclate"]
      },
      {
        "productid": 0123,
        "name": "cappucino",
        "quantity": 1,
        "choices": ["full", "2 X suger", "2 x choclate"]
      },
      {
        "productid": 0123,
        "name": "esprresso",
        "quantity": 3,
        "choices": ["full", "2 X suger", "2 x choclate"]
      },
    ];
    final data = ModalRoute.of(context)!.settings.arguments as List;
    final title = data.first;
    print(data);
    final listofData = data[1] as List<OrderDetails>;
    return Container(
      height: 100.h,
      width: 100.w,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/AdminBG.jpg",
              ),
              fit: BoxFit.fill)),
      child: GlassContainer.frostedGlass(
        height: 100.h,
        width: 100.w,
        blur: 17,
        padding: const EdgeInsets.all(0),
        frostedOpacity: 0.05,
        borderWidth: 0,
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 0.43),
              Color.fromRGBO(0, 0, 0, 0.85)
            ]),
        borderColor: Colors.transparent,
        child: Scaffold(
            backgroundColor: Colors.black38,
            appBar: AppBar(
              titleSpacing: 0,
              leadingWidth: 14.w,
              title: Text(title.toString(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600)),
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/ICONS/arrow3.png", scale: 3),
              ),
              backgroundColor: Colors.white12,
            ),
            body: Stack(
              children: [
                listofData.isEmpty
                    ? Center(
                        child: Text(
                          "No $title To Display 😓",
                          style: GoogleFonts.quicksand(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2.h,
                            childAspectRatio: 20.h / 50.w),
                        padding: EdgeInsets.only(top: 2.h),
                        itemCount: listofData.length,
                        itemBuilder: (context, index) =>
                            MerchantHomeScreenRowContainer(
                          items: listofData[index].items,
                          orderNo: listofData[index].orderNo,
                          orderId: listofData[index].orderId,
                        ),
                      ),
                if (dataLoading) ...[
                  Container(
                    color: Colors.black38,
                    child: const Center(
                        child: CircularProgressIndicator.adaptive(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white70))),
                  )
                ]
              ],
            )),
      ),
    );
  }
}
