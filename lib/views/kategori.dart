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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(1, 0, 17, 13),
        body: SafeArea(
          child: Column(children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 5 / 100,
                  width: MediaQuery.of(context).size.width - 30,
                  child: const TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        suffixIcon: Material(
                          color: Color.fromARGB(193, 181, 150, 72),
                          shadowColor: Color.fromARGB(193, 181, 150, 72),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13.0),
                            bottomRight: Radius.circular(13.0),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Cari nama tanaman',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139))),
                  ),
                )),
            Expanded(
                flex: 11,
                child: StreamBuilder(
                  stream: db.collection('kategori').snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView(
                        children: snapshot.data!.docs.map((doc) {
                          return Container(
                            // height:
                            //     MediaQuery.of(context).size.height * 80 / 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              doc.get('img'),
                                              fit: BoxFit.fill,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                      color: Color.fromARGB(
                                                          193, 181, 150, 72),
                                                    ),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                        doc.get('nama') ??
                                                            doc.get('nama'),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 36),
                                                        textAlign:
                                                            TextAlign.center),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ])),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Tanaman(
                                                  doc.get('nama'), doc.id)));
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
