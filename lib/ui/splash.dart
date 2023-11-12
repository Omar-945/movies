import 'package:flutter/material.dart';
import 'package:movies/ui/home_screen.dart';

class Splash extends StatelessWidget {
  static const String route = "SplashScreen";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    });
    return Container(
      child: Image.asset("assets/images/splash.png"),
    );
  }
}
