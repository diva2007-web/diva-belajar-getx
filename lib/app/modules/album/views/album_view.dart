import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/modules/album/controllers/album_controller.dart';
import 'package:belajar_getx/app/modules/album/views/album_detail_view.dart';

class AlbumView extends StatelessWidget {
  final AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Albums",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.deepPurple),
          );
        }

        if (controller.albums.isEmpty) {
          return const Center(
            child: Text(
              "Tidak ada album",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Hero(
                  tag: "albumTitle-${album.id}",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      album.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  Get.to(
                    () => AlbumDetailView(album: album),
                    transition: Transition.fadeIn, // 🔥 efek transisi
                    duration: const Duration(milliseconds: 400), // durasi smooth
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
