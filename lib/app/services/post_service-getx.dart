import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:belajar_getx/app/data/models/post_model.dart';

class PostService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Gagal memuat data posts");
    }
  }

  static Future<Post> fetchPostDetail(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/posts/$id"));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal memuat detail post");
    }
  }
}
