import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_farming/views/tanaman.dart';
import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  final db = FirebaseFirestore.instance;

  initSearch(String textEntered) async {
    var data;
    await db.collection('kategori').snapshots().forEach((element) {
      element.docs.toList().forEach((dt) {
        db
            .collection('kategori')
            .doc(dt.id)
            .collection(dt.get('nama'))
            .snapshots()
            .forEach((ada) {
          ada.docs.toList().forEach((i) {
            if (i.get('nama') == textEntered) {
              data = {
                "nama": i.get('nama'),
                "persiapan": i.get('persiapan'),
                "persiapanTanah": i.get('pesiapanTanah'),
                "persiapanBenih": i.get('persiapanBenih'),
                "pascaTanam": i.get('pascaTanam'),
                "catatan": i.get("Catatan")
              };
              // ignore: void_checks
              return data;
            }
          });
        });
      });
    });
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        // Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: TextField(
        //         //tambahin buat refer langsung ke tanaman yang mau dicari
        //         onChanged: (value) async {
        //           initSearch(value);
        //         },
        //         decoration: const InputDecoration(
        //             labelText: "Cari Tanaman",
        //             hintText: "Nama Tanaman",
        //             prefixIcon: Icon(Icons.search),
        //             border: OutlineInputBorder(
        //                 borderRadius:
        //                     BorderRadius.all(Radius.circular(10.0)))))),
        Expanded(
            child: StreamBuilder(
          stream: db.collection('kategori').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade300,
                                ),
                                child: Stack(children: [
                                  Image.network(
                                    doc.get('img'),
                                    fit: BoxFit.cover,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    opacity:
                                        const AlwaysStoppedAnimation<double>(
                                            0.3),
                                  ),
                                  Center(
                                    child: Text(
                                        doc.get('nama') ?? doc.get('nama'),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                                            fontSize: 36),
                                        textAlign: TextAlign.center),
                                  ),
                                ])),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Tanaman(doc.get('nama'), doc.id)));
                            }),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          },
        ))
      ]),
    ));
  }
}
