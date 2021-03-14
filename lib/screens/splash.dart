import 'package:flutter/material.dart';

import 'package:cannabusco/constants.dart';

import 'package:cannabusco/screens/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.contain)),
    );
  }
}
