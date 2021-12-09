import 'dart:async';

import 'package:flutter/material.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Screens/login_screen.dart';
import 'package:h_office/Utils/math_utils.dart';

class SplashScreen extends StatefulWidget {
  static const routes = "splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed(LoginScreen.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image(
          height: MathUtilities.screenHeight(context),
          width: MathUtilities.screenWidth(context),
          image: AssetImage(SplashScreenImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

