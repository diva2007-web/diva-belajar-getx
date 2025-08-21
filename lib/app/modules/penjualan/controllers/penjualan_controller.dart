import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenjualanController extends GetxController {
  final namaController = TextEditingController();
  final jumlahController = TextEditingController();
  final hargaController = TextEditingController();
  var selectedKategori = "".obs;

  @override
  void onClose() {
    namaController.dispose();
    jumlahController.dispose();
    hargaController.dispose();
    super.onClose();
  }
}
