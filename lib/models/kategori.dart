import 'dart:core';

class Kategori {
  String id;
  String nama;
  String img;

  Kategori(this.id, this.nama, this.img);

  Kategori.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nama = json['nama'],
        img = json['img'] ?? '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        "img": img,
      };
}
