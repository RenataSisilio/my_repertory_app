import 'dart:convert';

class Category {
  String name;
  List<String> subcats;

  Category(this.name, this.subcats);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'subcats': subcats});
  
    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['name'] ?? '',
      List<String>.from(map['subcats']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));
}
