import 'package:belajar_getx/app/services/post_service-getx.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/post_model.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var posts = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var result = await PostService.fetchPosts();
      posts.assignAll(result);
    } finally {
      isLoading(false);
    }
  }
}
