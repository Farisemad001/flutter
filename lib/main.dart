import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
        scaffoldBackgroundColor: const Color(0xFF402E7A),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
