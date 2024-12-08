import 'package:flutter/material.dart';

class Register2Screen extends StatefulWidget{

  @override
  Register1ScreenState createState() => Register1ScreenState();
}

class Register1ScreenState extends State<Register2Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Register"),
      ),
    );
  }
}