import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cade_meu_pet/app/ui/colors/colors.dart';

proSnackBar({
  String title = '',
  String message = '',
  Widget? icon,
  Color? backgroundColor,
  SnackPosition? snackPosition = SnackPosition.BOTTOM,
  int durationSeconds = 2,
}) {
  Get.snackbar(
    title, message,
    icon: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: icon,
    ),
    snackPosition: snackPosition,
    animationDuration: const Duration(milliseconds: 500),
    duration: Duration(seconds: durationSeconds),
    // duration: const Duration(minutes: 10), //para sumir
    // isDismissible: false,

    shouldIconPulse: true,
    borderRadius: 2,
    leftBarIndicatorColor: ProColors.redMedium,
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.all(15),
    margin: EdgeInsets.zero,
    barBlur: 30,
  );
}
