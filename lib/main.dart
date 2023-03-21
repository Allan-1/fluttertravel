import 'package:flutter/material.dart';
import 'package:mytravel/screens/loginscreen.dart';
import 'package:mytravel/screens/main_screen.dart';
import 'package:mytravel/util/const.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: const LoginScreen(),
    );
  }
}
