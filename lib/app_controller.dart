import 'models/category.dart';
import 'models/song.dart';
import 'app_repository.dart';

class AppController {
  final AppRepository repository;

  AppController(this.repository);

  Future<List<Category>> getCategories() async {
    return await repository.getAllCategories();
  }

  Future<List<Song>> selectSongs(String category) async {
    final List<Song> list = [];
    final categories = await repository.getAllCategories();
    final ifCat = categories.where((cat) => cat.name == category).toList();
    final songs = await repository.getAllSongs();
    if (ifCat.isNotEmpty) {
      for (var song in songs) {
        if (song.categories.contains(category)) {
          list.add(song);
        } else {
          for (var subCat in ifCat[0].subcats) {
            if (song.categories.contains(subCat)) {
              list.add(song);
              continue;
            }
          }
        }
      }
    } else {
      for (var song in songs) {
        if (song.categories.contains(category)) {
          list.add(song);
        }
      }
    }
    list.sort(((a, b) => a.title.compareTo(b.title)));
    return list;
  }
}
