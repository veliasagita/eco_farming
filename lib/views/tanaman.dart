import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class Tanaman extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  String namaKategori;
  String id;

  Tanaman(this.namaKategori, this.id, {Key? key}) : super(key: key);

  getLink(nama) {
    db.collection('kategori').snapshots().forEach((element) {
      element.docs.toList().forEach((dt) {
        db
            .collection('kategori')
            .doc(dt.id)
            .collection(dt.get('nama'))
            .snapshots()
            .forEach((ada) {
          ada.docs.toList().forEach((i) {
            final storageRef =
                storage.ref('/').child(i.get('nama') + '.jpg').getDownloadURL();
            try {
              db
                  .collection('kategori')
                  .doc(dt.id)
                  .collection(dt.get('nama'))
                  .doc(i.id)
                  .set({'img': storageRef});
            } catch (e) {
              db
                  .collection('kategori')
                  .doc(dt.id)
                  .collection(dt.get('nama'))
                  .doc(i.id)
                  .set({
                'img':
                    'https://firebasestorage.googleapis.com/v0/b/ecofarming-f867f.appspot.com/o/e5e5e5.png?alt=media&token=e161095f-7c7d-4b7c-8b13-cddc8d37d2d3'
              });
            }
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection('kategori')
              .doc(id)
              .collection(namaKategori)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      padding: const EdgeInsets.all(10),
                      children: snapshot.data!.docs.map((doc) {
                        getLink(doc.get('nama'));
                        return GestureDetector(
                            child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width / 3,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
                                child: Stack(children: [
                                  Image.network(
                                    doc.get('img'),
                                    fit: BoxFit.cover,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    opacity:
                                        const AlwaysStoppedAnimation<double>(
                                            0.5),
                                  ),
                                  Center(
                                    child: Text(
                                        doc.get('nama') ?? doc.get('nama'),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        textAlign: TextAlign.center),
                                  ),
                                ])),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Detail(
                                            doc.get('nama'),
                                            doc.get('persiapan'),
                                            doc.get('pesiapanTanah'),
                                            doc.get('persiapanBenih'),
                                            doc.get('pascaTanam'),
                                            doc.get('Catatan'),
                                          )));
                            });
                      }).toList()));
            }
          }),
    );
  }
}
