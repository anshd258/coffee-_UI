import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/notification_modal.dart';
import 'package:inter_coffee/provider/notification_provider.dart';
import 'package:inter_coffee/widgets/snackbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../widgets/notification_container.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late int numberofnotification;
  List<NotificatonModal>? data;
  @override
  void initState() {
    fetchdata();
    context.read<NotificationProvider>().markNotificationsRead();
    super.initState();
  }

  Future<void> fetchdata() async {
    final value =
        await context.read<NotificationProvider>().fetchNotifications();
    if (value != 200) {
      snackbar();
    }
    print(value);
  }

  void snackbar() => snakbarmethod(context, "unable to connect to backend");

  @override
  Widget build(BuildContext context) {
    data = context.watch<NotificationProvider>().notificatins;
    final isloading = context.watch<NotificationProvider>().isloading;
    numberofnotification = data!.length;
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
        frostedOpacity: 0.03,
        // color: Color.fromARGB(0, 255, 255, 255),
        gradient: LinearGradient(
            colors: notificationScreenBGGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderColor: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            leadingWidth: 6.w,
            title: Text("Notifications",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    color: Theme.of(context).navigationBarTheme.backgroundColor,
                    letterSpacing: 0.5,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600)),
            leading: SizedBox(
              width: 1.w,
            ),
            backgroundColor:
                Theme.of(context).navigationBarTheme.surfaceTintColor,
            bottom: PreferredSize(
              preferredSize: Size(100.w, 6.h),
              child: Center(
                child: SizedBox(
                  width: 90.w,
                  height: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0.5.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(),
                              child: Text(
                                'All($numberofnotification)',
                                style: GoogleFonts.inter(
                                    color: Theme.of(context)
                                        .navigationBarTheme
                                        .backgroundColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                        // Align(
                        //   alignment: Alignment.topCenter,
                        //   child: IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(
                        //         Icons.settings_outlined,
                        //         size: 22.sp,
                        //         color: titleStatusBar,
                        //       )),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: isloading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white70)),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.only(top: 1.5.h, bottom: 8.5.h),
                  child: data!.isEmpty && isloading == false && data != null
                      ? Container(
                          width: 100.w,
                          margin: EdgeInsets.only(bottom: 7.h),
                          height: 90.h,
                          alignment: Alignment.center,
                          child: Text(
                            "No Notifications To Show 😓",
                            style: GoogleFonts.quicksand(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70),
                          ))
                      : SizedBox(
                          width: 100.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: data!
                                .map((e) => NotificationContainer(
                                      notification: e,
                                    ))
                                .toList(),
                          ),
                        )),
        ),
      ),
    );
  }
}
