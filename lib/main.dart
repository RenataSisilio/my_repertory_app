import 'package:flutter/material.dart';
import 'package:my_repertory/models/category.dart';

import 'models/song.dart';
import 'my_app.dart';

class Repertory {
  final List<Category> categories;
  final List<Song> songs;

  Repertory(this.categories, this.songs);
}

void main() async {
  runApp(const MyApp());
}
