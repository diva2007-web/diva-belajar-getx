import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  final nameController = TextEditingController();

  var selectedCourse = "".obs;
  var gender = "".obs;
  var birthDate = DateTime.now().obs;

  final courses = [
    "Flutter Development",
    "Web Development",
    "Data Science",
    "UI/UX Design",
    "Cyber Security",
  ];

  String get formattedDate => DateFormat('dd MMM yyyy').format(birthDate.value);

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: birthDate.value,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      birthDate.value = pickedDate;
    }
  }

  void clearForm(dynamic selectedDate) {
    nameController.clear();
    selectedCourse.value = '';
    gender.value = '';
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
