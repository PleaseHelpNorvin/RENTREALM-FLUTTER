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
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Set your desired color here
          ),
          cardTheme: CardTheme(
            color: Colors.blueAccent, // Set your desired card background color here
          ),
          iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 255, 255, 255), // Set default icon color for all icons
          ),

          textTheme: const TextTheme(
            headlineLarge: TextStyle(color: Colors.black), // Equivalent to headline1
            headlineMedium: TextStyle(color: Colors.black), // Equivalent to headline2
            headlineSmall: TextStyle(color: Colors.black), // Equivalent to headline3
            titleLarge: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Equivalent to headline4
            titleMedium: TextStyle(color: Color.fromARGB(255, 245, 240, 240)), // Equivalent to headline5
            titleSmall: TextStyle(color: Color.fromARGB(255, 237, 236, 236)), // Equivalent to headline6
            bodyLarge: TextStyle(color: Colors.black), // Equivalent to bodyText1
            bodyMedium: TextStyle(color: Colors.black), // Equivalent to bodyText2
            bodySmall: TextStyle(color: Colors.black), // Equivalent to bodyText2 small
            labelLarge: TextStyle(color: Colors.black), // Equivalent to subtitle1
            labelMedium: TextStyle(color: Colors.black), // Equivalent to subtitle2
            labelSmall: TextStyle(color: Colors.black), // Equivalent to caption
          ),
        ),
      home: GetstartedScreen(),
    );
  }
}
