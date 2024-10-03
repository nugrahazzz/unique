import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:unique/core/constant/assets/lottie_path.dart';
import 'package:unique/core/utils/extensions/global_extensions.dart';

void showCongratulationDialog() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.transparent,
      content: SizedBox(
        width: 50.0.wp,
        height: 50.0.wp,
        child: Lottie.asset(
          LottiePath.congratulation, // Ganti dengan path file Lottie kamu
          fit: BoxFit.cover,
        ),
      ),
    ),
    barrierDismissible:
        false, // Mencegah dialog ditutup dengan mengetuk di luar
  );

// Menutup dialog setelah 3 detik
  Future.delayed(const Duration(seconds: 2), () {
    if (Get.isDialogOpen!) {
      Get.backLegacy(); // Menutup dialog
    }
  });
}
