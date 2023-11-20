import 'dart:async';
import 'package:deeratna/Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String routName = "/";
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
      () => Navigator.popAndPushNamed(
        context,
        RootPage.routName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool isDarkModeEnabled = Provider.of(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Image.asset(
              './Assets/images/splash.jpg',
              fit: BoxFit.fill,
              width: size.width,
              height: size.height,
            ),
            Center(
              child: Lottie.asset(
                './Assets/images/deratna-fell.json',
                width: 600,
                height: 600,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
