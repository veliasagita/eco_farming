// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';

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
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 8 / 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300),
            child: Center(
              child: Text(
                nama,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            )),
        Divider(
          color: Colors.grey.shade300,
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
                color: Colors.grey.shade300),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text('Persiapan:\n\n' + persiapan + '\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.justify),
                    Text(
                        persiapanTanah == ""
                            ? ''
                            : 'Persiapan Tanah:\n\n' + persiapanTanah + '\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.justify),
                    Text(
                        persiapanBenih == ""
                            ? ''
                            : 'Persiapan Benih:\n\n' + persiapanBenih + '\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.justify),
                    Text('Pasca Tanam:\n\n' + pascaTanam + '\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.justify),
                    Text('Catatan:\n\n' + catatan,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.justify),
                  ],
                ))),
        Divider(
          color: Colors.grey.shade300,
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Center(
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreen.shade200,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: generatePDF,
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.download,
                      size: 10, color: Colors.green),
                  Text('Download Cara Aplikasi Pupuk',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.justify),
                ],
              )),
        ),
        Row(
          children: [
            const Text('Informasi Lebih Lanjut :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.1),
                textAlign: TextAlign.justify),
            GestureDetector(
              child: const Icon(
                FontAwesomeIcons.youtubeSquare,
                size: 30,
                color: Colors.red,
              ),
              onTap: () {
                launch(
                    'https://www.youtube.com/channel/UCrhDkjkwg7zV9AwtJz53omQ');
              },
            ),
            GestureDetector(
              child: const Icon(
                FontAwesomeIcons.whatsappSquare,
                size: 30,
                color: Colors.green,
              ),
              onTap: () {},
            ),
          ],
        )
      ]),
    ));
  }

  void generatePDF() async {
    final pdf = pw.Document();
    final font =
        await rootBundle.load("assets/Times-New-Roman/times-new-roman.ttf");
    var myFont = pw.Font.ttf(font);

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
