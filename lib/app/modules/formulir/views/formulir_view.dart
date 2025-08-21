import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';
import 'formulir_output_view.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar Modern
      appBar: AppBar(
        title: const Text(
          'Formulir Pendaftaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildCard(
              child: TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown
            Obx(
              () => _buildCard(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Pilih Kursus',
                    prefixIcon: Icon(Icons.school),
                    border: InputBorder.none,
                  ),
                  value: controller.selectedCourse.value.isEmpty
                      ? null
                      : controller.selectedCourse.value,
                  items: controller.courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCourse.value = value;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Radio Gender
            _buildCard(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jenis Kelamin",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: "Laki-laki",
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.gender.value = value;
                            }
                          },
                        ),
                        const Text("Laki-laki"),
                        Radio<String>(
                          value: "Perempuan",
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.gender.value = value;
                            }
                          },
                        ),
                        const Text("Perempuan"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Date Picker
            Obx(
              () => _buildCard(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Lahir",
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () => controller.pickDate(),
                    ),
                  ),
                  controller: TextEditingController(
                    text: controller.formattedDate,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Submit dengan gradient
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.deepPurple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Get.to(
                    () => FormulirOutputView(
                      nama: controller.nameController.text,
                      kursus: controller.selectedCourse.value,
                      gender: controller.gender.value,
                      tanggal: controller.formattedDate,
                    ),
                  );
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card Wrapper untuk styling input
  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
