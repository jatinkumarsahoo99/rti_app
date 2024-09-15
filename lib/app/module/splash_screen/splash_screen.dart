import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    setTimer();
    super.initState();
  }

  setTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   "/homePage",
      //   (Route<dynamic> route) => false,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(child: Image.asset("assets/images/logo.png",width:size.width*0.8 ,)),
    );
  }
}
