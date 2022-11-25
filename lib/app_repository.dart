import 'package:dio/dio.dart';

import 'models/category.dart';
import 'models/song.dart';

const String _categoryListUrl =
    'https://renatasisilio.github.io/my_repertory_app/categories.json';
const String _songListUrl =
    'https://renatasisilio.github.io/my_repertory_app/songs.json';

abstract class AppRepository {
  Future<List<Category>> getAllCategories();
  Future<List<Song>> getAllSongs();
}

class AppDioRepository implements AppRepository {
  final Dio _dio = Dio();

  @override
  Future<List<Category>> getAllCategories() async {
    final Response<List> response = await _dio.get(_categoryListUrl);
    try {
      final List<Category> categories =
          response.data!.map((e) => Category.fromMap(e)).toList();
      return categories;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Song>> getAllSongs() async {
    final Response<List> response = await _dio.get(_songListUrl);
    try {
      final List<Song> songs =
          response.data!.map((e) => Song.fromMap(e)).toList();
      return songs;
    } catch (e) {
      return [];
    }
  }
}
