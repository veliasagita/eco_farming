import 'dart:async';
import 'package:flutter/material.dart';
import 'kategori.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreen createState() => _MySplashScreen();
}

class _MySplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Kategori())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 17, 13),
        body: SafeArea(
          child: Stack(children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5,
                      color: const Color.fromARGB(255, 181, 150, 72),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 5,
                      color: const Color.fromARGB(255, 181, 150, 72),
                    )
                  ]),
            ),
            Center(
              child: Column(
                children: [
                  const Divider(height: 250),
                  const Image(
                    image: AssetImage('assets/logo-eco.png'),
                  ),
                  const Image(
                    image: AssetImage('assets/LSO Logo-02-02 1.png'),
                  ),
                  const Text(
                    'IZIN EDAR KEMENTRIAN PERTANIAN\n02.08.2020.005',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 6,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(height: 50),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'PRODUCED BY',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 8,
                              color: Colors.white),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: 10,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Text(
                          'PT BANDUNG INOVASI ORGANIK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Color.fromARGB(255, 181, 150, 72)),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: 50,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/Vege-Eco Farming (Original)-02 1.png'),
                      alignment: Alignment.bottomCenter)),
            ),
          ]),
        ));
  }
}
