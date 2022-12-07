import 'package:flutter/material.dart';

import '../app_repository.dart';
import 'home_controller.dart';
import 'widgets/song_list_tile.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController(AppDioRepository());
    return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: FutureBuilder(
            future: controller.selectSongs(category),
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                final list = snapshot.data!;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return SongListTile(list: list, index: index);
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
