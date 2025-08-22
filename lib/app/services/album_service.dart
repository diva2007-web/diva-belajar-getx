import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlbumService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/albums";

  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load albums");
    }
  }
}
