import 'dart:async';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/presentaion/loginpage/login_page.dart';
import 'package:bloc_volunteer_service/presentaion/mainpage/scrren_main_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => box.read('user') != null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ScreenMainPage()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: backgroundColor,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('images/1.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Image.asset('images/splashScreenLogo.png'),
            ConstSize.kheight1,
            Text(
              'FIVE MIN VOLUNTEER SERVICES',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text('Version 0.2.002\n  (10-03-2022)'))
          ],
        ),
      ),
    );
  }
}
