import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:belajar_getx/app/services/album_service.dart';

class AlbumController extends GetxController {
  var albums = <AlbumModel>[].obs;
  var isLoading = true.obs;

  final AlbumService _albumService = AlbumService();

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();
  }

  void fetchAlbums() async {
    try {
      isLoading(true);
      var result = await _albumService.fetchAlbums();
      albums.assignAll(result);
    } finally {
      isLoading(false);
    }
  }
}
