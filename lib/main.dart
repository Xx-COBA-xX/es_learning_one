import 'package:es_learning_one/constants.dart';
import 'package:flutter/material.dart';
import 'screens/auth_screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: kBackgoundColor,
            fontSize: 26,
            fontFamily: 'myFont',
            fontWeight: FontWeight.w700
          ),
          bodySmall: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontFamily: 'myFont',
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
