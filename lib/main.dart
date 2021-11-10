import 'package:flutter/material.dart';
import 'package:h_office/Screens/home_screen.dart';
import 'package:h_office/Screens/lead_screen.dart';

import 'Helper/theme_helper.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: appTheme.primaryTheme,
        accentColor: appTheme.primaryTheme,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: appTheme.canvasColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        LeadScreen.routes: (context) => LeadScreen(),
      },
    );
  }
}
