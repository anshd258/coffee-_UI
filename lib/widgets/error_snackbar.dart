import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void errorSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
      dismissType: DismissType.onTap,
      animationDuration: const Duration(seconds: 1),
      displayDuration: const Duration(seconds: 10),
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        iconPositionTop: -10,
        iconRotationAngle: 0,
        backgroundColor: Colors.black54,
        iconPositionLeft: 10,
        messagePadding: EdgeInsets.only(left: 10.w),
        icon: Icon(Icons.warning_amber_rounded,
            color: Colors.orangeAccent.shade200, size: 30.sp),
      ));
}
