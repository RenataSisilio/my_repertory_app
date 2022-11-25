import 'package:flutter/material.dart';

import '../../models/song.dart';
import '../launch_url_string.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({
    Key? key,
    required this.list,
    required this.index,
    required this.type,
  }) : super(key: key);

  final List<Song> list;
  final int index;
  final String type;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  @override
  Widget build(BuildContext context) {
    final url = widget.type == 'lyrics'
        ? widget.list[widget.index].lyricsURL
        : widget.list[widget.index].chordsURL;
    return IconButton(
      onPressed: () {
        if (url != '') {
          launchUrlString(url);
        }
      },
      icon: widget.type == 'lyrics'
          ? const Icon(Icons.music_note)
          : const Icon(Icons.music_video),
    );
  }
}
