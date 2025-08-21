import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PenjualanOutputView extends StatelessWidget {
  final String namaBarang;
  final String kategori;
  final int jumlah;
  final int harga;
  final int total;
  final int totalDiskon;

  const PenjualanOutputView({
    Key? key,
    required this.namaBarang,
    required this.kategori,
    required this.jumlah,
    required this.harga,
    required this.total,
    required this.totalDiskon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format tanggal otomatis
    String tanggal = DateFormat("dd MMMM yyyy, HH:mm").format(DateTime.now());

    // Format Rupiah
    final currency = NumberFormat.currency(
      locale: "id_ID",
      symbol: "Rp ",
      decimalDigits: 0,
    );

    // Hitung diskon persen
    int diskonPersen = total >= 100000 ? 10 : 0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Nota Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Header Logo + Nama Toko
            Column(
              children: [
                const Icon(Icons.store_mall_directory,
                    size: 60, color: Colors.deepPurple),
                const SizedBox(height: 8),
                const Text(
                  "DIVA MARKET",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  tanggal,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),
              ],
            ),

            // 🔹 Card Nota
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.inventory, color: Colors.deepPurple),
                      title: Text(
                        namaBarang,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text("Kategori: $kategori"),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah"),
                        Text("$jumlah pcs"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Harga/Unit"),
                        Text(currency.format(harga)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Sebelum Diskon"),
                        Text(currency.format(total)),
                      ],
                    ),
                    if (diskonPersen > 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Diskon"),
                          Text("$diskonPersen%"),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Setelah Diskon",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          currency.format(totalDiskon),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 🔹 Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Kembali"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () => Get.offAllNamed("/penjualan"),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
