import 'package:flutter/material.dart';
import 'package:rentrealm/screen/auth/login.dart';
import './screen/getstarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Keep the white color
        ),
        cardTheme: CardTheme(
          color: Colors.blueAccent,
        ),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Colors.black),
          headlineMedium: TextStyle(color: Colors.black),
          headlineSmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          titleMedium: TextStyle(color: Color.fromARGB(255, 245, 240, 240)),
          titleSmall: TextStyle(color: Color.fromARGB(255, 237, 236, 236)),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelMedium: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                ),
                title: Text('Your Title'),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                GetstartedScreen(), // Your screen content
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
