import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 6,
        shadowColor: Colors.deepPurpleAccent,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.deepPurple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Jumlah Hitungan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Angka Counter dengan bounce animasi
              Obx(() => AnimatedScale(
                    scale: 1.0 + (controller.count.value.abs() * 0.05),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.elasticOut,
                    child: Text(
                      controller.count.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: controller.count.value > 0
                            ? Colors.greenAccent
                            : controller.count.value < 0
                                ? Colors.redAccent
                                : Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  )),

              const SizedBox(height: 50),

              // Tombol Aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                    icon: Icons.remove,
                    color: Colors.redAccent,
                    onTap: controller.kurang,
                  ),
                  const SizedBox(width: 30),
                  _buildActionButton(
                    icon: Icons.replay,
                    color: Colors.orange,
                    onTap: () => controller.count.value = 0,
                  ),
                  const SizedBox(width: 30),
                  _buildActionButton(
                    icon: Icons.add,
                    color: Colors.green,
                    onTap: controller.tambah,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Button
  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      elevation: 8,
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.white24,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Icon(icon, size: 32, color: Colors.white),
        ),
      ),
    );
  }
}
