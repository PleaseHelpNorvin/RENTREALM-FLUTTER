import 'package:flutter/material.dart';
import 'package:rentrealm/screen/auth/login.dart';
import './screen/getstarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetstartedScreen(),
    );
  }
}
