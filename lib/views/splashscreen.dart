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
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Kategori())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Scaffold(
          backgroundColor: Colors.white,
        ),
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo-eco.png'),
                    alignment: Alignment.center))),
      ],
    );
  }
}
