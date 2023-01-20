import 'dart:async';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const MyHomePage(title: "Home"))));
          


    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Text(
          'SplashScreen',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
