import 'dart:async';

import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Color> _colors = [
    Color(0xFF0A0E22).withOpacity(0.3),
    Color(0xFF0A0E21).withOpacity(0.6),
//    Colors.pink.withOpacity(0.5)
  ];

  final splashDelay = 1;
  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: _colors, begin: Alignment.topCenter)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100, right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/pay_icon.png",
                    scale: 5.0, width: 48.0, height: 48.0),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Easy Pay App',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'provide payment system services for various products that are essential for people.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
