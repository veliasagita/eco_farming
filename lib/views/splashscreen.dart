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
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo-eco.png'),
                      alignment: Alignment.center)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5,
                    color: const Color.fromARGB(255, 181, 150, 72),
                  ),
                  Container(
                    height: 5,
                    color: const Color.fromARGB(255, 181, 150, 72),
                  )
                ],
              ),
            ),
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
                    color: Color.fromARGB(255, 0, 17, 13),
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
                    color: Color.fromARGB(255, 0, 17, 13),
                    height: 50,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
