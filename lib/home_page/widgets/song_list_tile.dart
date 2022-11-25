import 'package:flutter/material.dart';

import '../../models/song.dart';
import 'link_button.dart';

class SongListTile extends StatefulWidget {
  const SongListTile({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  final List<Song> list;
  final int index;

  @override
  State<SongListTile> createState() => _SongListTileState();
}

class _SongListTileState extends State<SongListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.list[widget.index].title),
      subtitle: Text(widget.list[widget.index].categories
          .toString()
          .replaceAll(RegExp(r'[\[-\]]'), '')),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinkButton(
            list: widget.list,
            index: widget.index,
            type: 'lyrics',
          ),
          LinkButton(
            list: widget.list,
            index: widget.index,
            type: 'chords',
          ),
        ],
      ),
      onLongPress: () {},
    );
  }
}
