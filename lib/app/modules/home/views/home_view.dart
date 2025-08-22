import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            // Menu Formulir
            _buildMenuCard(
              icon: Icons.assignment,
              label: "Formulir",
              color: Colors.blue,
              onTap: () => Get.toNamed("/formulir"),
            ),

            // Menu Counter
            _buildMenuCard(
              icon: Icons.add_circle_outline,
              label: "Counter",
              color: Colors.green,
              onTap: () => Get.toNamed("/counter"),
            ),

            // Menu Penjualan
            _buildMenuCard(
              icon: Icons.shopping_cart,
              label: "Penjualan",
              color: Colors.deepPurple,
              onTap: () => Get.toNamed("/penjualan"),
            ),

            // ✅ Menu Post
            _buildMenuCard(
              icon: Icons.article,
              label: "Posts",
              color: Colors.orange,
              onTap: () => Get.toNamed("/post"),
            ),

            // album
            _buildMenuCard(
              icon: Icons.photo_album,
              label: "Allbum",
              color: const Color.fromARGB(255, 110, 106, 148),
              onTap: () => Get.toNamed("/album"),
            ),
          ],
        ),
      ),
    );
  }

  // Widget menu dengan ripple + animasi scale
  Widget _buildMenuCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 150),
      tween: Tween(begin: 1, end: 1),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Material(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: color.withOpacity(0.3), // ripple efek
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 50, color: color),
                const SizedBox(height: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
