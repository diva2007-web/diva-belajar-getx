import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;

  void tambah() {
    if (count.value < 50) {
      count.value++;
    } else {
      Get.snackbar("STOP!!!", "Nilai Sudah Mencapai 50",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void kurang() {
    if (count.value > 0) {
      count.value--;
    } else {
      Get.snackbar("STOP!!!", "Nilai Sudah Mencapai 0",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}