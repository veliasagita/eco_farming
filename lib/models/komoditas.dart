import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Komoditas {
  //variable
  String tanaman;
  String persiapan;
  String persiapanTanah;
  String? persiapanBenih;
  String pascaTanam;
  String catatan;

  Komoditas(this.tanaman, this.persiapan, this.persiapanTanah,
      this.persiapanBenih, this.pascaTanam, this.catatan);

  Komoditas.fronSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : tanaman = snapshot['tanaman'],
        persiapan = snapshot['persiapan'],
        persiapanTanah = snapshot['persiapanTanah'],
        persiapanBenih = snapshot['persiapanBenih'],
        pascaTanam = snapshot['pascaTanam'],
        catatan = snapshot['catatan'];

  Komoditas.fromJson(Map<String, dynamic> json)
      : tanaman = json['tanaman'],
        persiapan = json['persiapan'],
        persiapanTanah = json['persiapanTanah'],
        persiapanBenih = json['persiapanBenih'],
        pascaTanam = json['pascaTanam'],
        catatan = json['catatan'];
  Map<String, dynamic> toJson() => {
        'tanaman': tanaman,
        'persiapan': persiapan,
        'persiapanTanah': persiapanTanah,
        'persiapanBenih': persiapanBenih,
        'pascaTanam': pascaTanam,
        'catatan': catatan
      };
}
