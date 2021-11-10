import 'package:flutter/material.dart';
import 'package:h_office/Screens/contact_screen.dart';
import 'package:h_office/Screens/home_screen.dart';
import 'package:h_office/Screens/lead&task_screen.dart';
import 'package:h_office/Screens/splash_screen.dart';

import 'Helper/theme_helper.dart';
import 'Screens/TaskScreens/task_screen.dart';
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
        "/": (context) => SplashScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        LeadTaskScreen.routes: (context) => LeadTaskScreen(),
        ContactScreen.routes: (context) => ContactScreen(),
        TaskScreen.routes: (context) => TaskScreen(),
      },
    );
  }
}
