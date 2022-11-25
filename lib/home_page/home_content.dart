import 'package:flutter/material.dart';
import 'package:my_repertory/app_controller.dart';
import 'package:my_repertory/app_repository.dart';

import 'widgets/song_list_tile.dart';

class HomeContent extends StatelessWidget {
  final String category;

  const HomeContent({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AppController(AppDioRepository());
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
