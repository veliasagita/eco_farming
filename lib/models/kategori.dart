import 'dart:core';

class Kategori {
  String id;
  String name;
  String img;

  Kategori(this.id, this.name, this.img);

  Kategori.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        img = json['img'] ?? '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': name,
        "img": img,
      };
}
