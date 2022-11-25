import 'dart:convert';

class Song {
  final String title;
  final List<String> categories;
  final String lyricsURL;
  final String chordsURL;
  final bool favorite;

  Song({
    required this.title,
    required this.categories,
    this.lyricsURL = '',
    this.chordsURL = '',
    this.favorite = false,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'categories': categories});
    result.addAll({'lyricsURL': lyricsURL});
    result.addAll({'chordsURL': chordsURL});
    result.addAll({'favorite': favorite});
  
    return result;
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'] ?? '',
      categories: List<String>.from(map['categories']),
      lyricsURL: map['lyricsURL'] ?? '',
      chordsURL: map['chordsURL'] ?? '',
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source));
}
