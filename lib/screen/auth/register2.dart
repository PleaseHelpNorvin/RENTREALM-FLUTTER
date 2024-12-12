import 'package:flutter/material.dart';

class Register2Screen extends StatefulWidget{
  final int userId;
  final String name;
  final String email;
  final String token;

  const Register2Screen({
    required this.userId,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  Register2ScreenState createState() => Register2ScreenState();
}

class Register2ScreenState extends State<Register2Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("CreateProfile"),
      ),
    );
  }
}