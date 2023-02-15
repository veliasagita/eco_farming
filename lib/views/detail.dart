// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher_string.dart';

class Detail extends StatelessWidget {
  String nama;
  String persiapan;
  String persiapanTanah;
  String persiapanBenih;
  String pascaTanam;
  String catatan;

  Detail(this.nama, this.persiapan, this.persiapanTanah, this.persiapanBenih,
      this.pascaTanam, this.catatan,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                const Positioned(
                  bottom: 0,
                  child: Image(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(
                          'assets/Vege-Eco Farming (Original)-02 1.png')),
                ),
                Column(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 5 / 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          nama,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Color.fromARGB(255, 15, 109, 56),
                              decoration: TextDecoration.none),
                        ),
                      )),
                  const Divider(
                    color: Color.fromARGB(255, 217, 217, 217),
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 60 / 100,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217)),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Text('Persiapan:\n\n' + persiapan + '\n',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify),
                              Text(
                                  persiapanTanah == ""
                                      ? ''
                                      : 'Persiapan Tanah:\n\n' +
                                          persiapanTanah +
                                          '\n',
                                  style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify),
                              Text(
                                  persiapanBenih == ""
                                      ? ''
                                      : 'Persiapan Benih:\n\n' +
                                          persiapanBenih +
                                          '\n',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify),
                              Text('Pasca Tanam:\n\n' + pascaTanam + '\n',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify),
                              Text('Catatan:\n\n' + catatan,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify),
                            ],
                          ))),
                  const Divider(
                    color: Color.fromARGB(255, 217, 217, 217),
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Center(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 15, 109, 56),
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: generatePDF,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                                'DOWNLOAD CARA APLIKASI PUPUK ORGANIK ECO FARMING',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                                textAlign: TextAlign.justify),
                          ],
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Informasi Lebih Lanjut :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              letterSpacing: 0.1),
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Image.asset('assets/whatsapp.png'),
                        onTap: () {
                          launchUrlString('wa.me/message/UNNBBNWYOLWYM1');
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Image.asset('assets/instagram.png'),
                        onTap: () {
                          launchUrlString(
                              'https://instagram.com/biosoltamax.id?igshid=Zjc2ZTc4Nzk=');
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Image.asset('assets/youtube.png'),
                        onTap: () {
                          launchUrlString(
                              'www.youtube.com/channel/UCrhDkjkwg7zV9AwtJz53omQ');
                        },
                      ),
                    ],
                  ),
                ]),
              ],
            )));
  }

  void generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Container(
            child: pw.Column(children: [
          pw.Text(
            'Prosedur Penggunaan Pupuk Organik Bio Farming pada',
          ),
          pw.Text('Tanaman $nama'),
          pw.Text(
            persiapanTanah == ""
                ? ''
                : 'Persiapan Tanah:\n\n' + persiapanTanah + '\n\n',
          ),
          pw.Text(
            persiapanBenih == ""
                ? ''
                : 'Persiapan Benih:\n\n' + persiapanBenih + '\n\n',
          ),
          pw.Text(
            'Pasca Tanam:\n\n' + pascaTanam + '\n\n',
          ),
          pw.Text(
            'Catatan:\n\n' + catatan,
          ),
        ])),
      ),
    );

    var dir = await getExternalStorageDirectory();
    await dir?.create(recursive: true);
    final file = File('${dir!.path}/Prosedur $nama.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
