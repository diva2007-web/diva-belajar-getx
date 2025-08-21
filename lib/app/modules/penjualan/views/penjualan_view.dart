import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'penjualan_output_view.dart';

class PenjualanView extends GetView<PenjualanController> {
  const PenjualanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Form Penjualan Barang"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Card Form
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle("Nama Barang"),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller.namaController,
                    "Masukkan nama barang",
                    icon: Icons.shopping_bag,
                  ),

                  const SizedBox(height: 16),
                  _buildTitle("Jumlah"),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller.jumlahController,
                    "Masukkan jumlah",
                    inputType: TextInputType.number,
                    icon: Icons.format_list_numbered,
                  ),

                  const SizedBox(height: 16),
                  _buildTitle("Harga per Unit"),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller.hargaController,
                    "Masukkan harga",
                    inputType: TextInputType.number,
                    icon: Icons.attach_money,
                  ),

                  const SizedBox(height: 16),
                  _buildTitle("Kategori Barang"),
                  const SizedBox(height: 8),
                  Obx(() => DropdownButtonFormField<String>(
                        value: controller.selectedKategori.value.isEmpty
                            ? null
                            : controller.selectedKategori.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.category,
                              color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: ["Makanan", "Minuman", "Alat Tulis"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            controller.selectedKategori.value = val;
                          }
                        },
                      )),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  int jumlah = int.tryParse(controller.jumlahController.text) ?? 0;
                  int harga = int.tryParse(controller.hargaController.text) ?? 0;
                  int total = jumlah * harga;
                  int totalDiskon =
                      total >= 100000 ? (total * 0.9).toInt() : total;

                  Get.to(() => PenjualanOutputView(
                        namaBarang: controller.namaController.text,
                        kategori: controller.selectedKategori.value,
                        jumlah: jumlah,
                        harga: harga,
                        total: total,
                        totalDiskon: totalDiskon,
                      ));
                },
                label: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Widget helper judul kecil
  Widget _buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  // 🔹 Widget helper textfield modern + icon
  Widget _buildTextField(TextEditingController controller, String hint,
      {TextInputType inputType = TextInputType.text, IconData? icon}) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: Colors.deepPurple)
            : null,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
