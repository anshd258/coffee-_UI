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
  const ProductListMainContainer({super.key});

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
    var cTime = DateTime.now();
    String curTime = cTime.hour.toString().padLeft(2,'0') + cTime.minute.toString().padLeft(2,'0');
    int currTime = int.parse(curTime);
    // API Call to get closed timings
    await context.read<SetCafeTimings>().getCafeTimings();
    message = context.read<SetCafeTimings>().message!;
    int weekday = cTime.weekday;
    String weekDay = "MONDAY";
    switch (weekday) {
      case 1:
        weekDay = "MONDAY";
        break;
      case 2:
        weekDay = "TUESDAY";
        break;
      case 3:
        weekDay = "WEDNESDAY";
        break;
      case 4:
        weekDay = "THURSDAY";
        break;
      case 5:
        weekDay = "FRIDAY";
        break;
      case 6:
        weekDay = "SATURDAY";
        break;
      case 7:
        weekDay = "SUNDAY";
        break;
    }
    int s = 800;
    int e = 1600;
    for (var element in context.read<SetCafeTimings>().cafeTimings! ) {
      if( element.day == weekDay ) {

        if( element.openTime!.substring(4) == "PM" ) {
          s = int.parse( "${element.openTime!.substring(0,1)}${element.openTime!.substring(2,4)}" ) + 1200;
        } else {
          s = int.parse( "${element.openTime!.substring(0,1)}${element.openTime!.substring(2,4)}" );
        }
        
        if( element.closeTime!.substring(4) == "PM" ) {
          e = int.parse( "${element.closeTime!.substring(0,1)}${element.closeTime!.substring(2,4)}" ) + 1200;
        } else {
          e = int.parse( "${element.closeTime!.substring(0,1)}${element.closeTime!.substring(2,4)}" );
        }
      }
    }
    s = 1300;
    setState(() {
      if( s <= 1200 ) {
        String st = s.toString().padLeft(4,"0");
        start = "${st.substring(0,2)}:${st.substring(2)}AM";
      } else {
        String st = s.toString().padLeft(4,"0");
        start = "${(int.parse(st.substring(0,2))-12).toString().padLeft(2,'0')}:${st.substring(2).padLeft(2,'0')}PM";
      }
      if( e <= 1200 ) {
        String nd = e.toString().padLeft(4,"0");
        end = "${nd.substring(0,2).padLeft(2,'0')}:${nd.substring(2).padLeft(2,'0')}AM";
      } else {
        String nd = e.toString().padLeft(4,"0");
        end = "${(int.parse(nd.substring(0,2))-12).toString().padLeft(2,'0')}:${nd.substring(2).padLeft(2,'0')}PM";
      }
    });
    print("currTime -> $currTime");
    print("start -> $start");
    print("end -> $end");
    if( currTime > e || currTime < s ) {
      shopIsClosed = true;
    } else {
      shopIsClosed = false;
    }
    context.read<SetCafeTimings>().changeShopStatus(shopIsClosed);
  }

  @override
  void initState() {
    getproducts();
    checkIfShopClosed();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductsProvider>().productslist;
    

    bool doesCartHasProduct() {
      final checkOutCart = context.read<CartProductsProvider>().cartData;
      
      if( onTap == true ) {
        return true;
      }
      if( checkOutCart.isNotEmpty ) {
        return true;
      } else {
        return false;
      }
    }
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
                    : Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: data.map((e) {
                                  return ProductListScreenLowerListContainer(
                                    e: e,
                                  );
                                }).toList(),
                              ),
                              Visibility(
                                visible: shopIsClosed,
                                child: GlassContainer.frostedGlass(
                                  height: 100.h,
                                  width: 100.w,
                                  blur: 14,
                                  frostedOpacity: 0.04,
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black26,
                                ),
                              ),
                              Visibility(
                                visible: shopIsClosed,
                                child: Positioned(
                                  top: 10.h,
                                  left: 10.w,
                                  child: DialogBox(
                                    start: start,
                                    end: end,
                                    message: message,
                                  ),
                                ),
                              ),
                            ],
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
