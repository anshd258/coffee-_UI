import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inter_coffee/constants/colors.dart';
import 'package:inter_coffee/models/notificationmodal.dart';
import 'package:inter_coffee/provider/notificationprovider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../widgets/notificationcontainer.dart';

class NotificationPg extends StatefulWidget {
  const NotificationPg({super.key});

  @override
  State<NotificationPg> createState() => _NotificationPgState();
}

class _NotificationPgState extends State<NotificationPg> {
  late int numberofnotification;
  List<NotificatonModal>? data;
  @override
  void initState() {
    context.read<NotificationProvider>().fetchNotifications();

    super.initState();
  }

  @override
  void dispose() {
    context.read<NotificationProvider>().clearNotifications();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = context.watch<NotificationProvider>().notificatins;
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
            title: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeLeft: true,
              removeBottom: true,
              removeRight: true,
              child: Container(
                color: bgStatusBar,
                child: Text("Notifications",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                        color: titleStatusBar,
                        letterSpacing: 0.5,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            leading: SizedBox(
              width: 1.w,
            ),
            backgroundColor: bgStatusBar,
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
                                    color: titleStatusBar,
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
          body: Center(
            heightFactor: 95.h,
            widthFactor: 100.w,
            child: data == null
                ? CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white70))
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: data!.isEmpty
                        ? Container(
                            width: 100.w,
                            height: 90.h,
                            alignment: Alignment.center,
                            child: Text(
                              "No Notifications To Show 😓",
                              style: GoogleFonts.quicksand(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70),
                            ))
                        : Column(
                            children: data!
                                .map((e) => notificationContainer(
                                      notification: e,
                                    ))
                                .toList(),
                          )),
          ),
        ),
      ),
    );
  }
}
