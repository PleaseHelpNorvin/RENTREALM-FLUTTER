import 'package:flutter/material.dart';
import '../auth/login.dart';

class Register1Screen extends StatefulWidget{

  @override
  Register1ScreenState createState() => Register1ScreenState();
}

class Register1ScreenState extends State<Register1Screen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Register"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/rentrealm_logo.png",
                  width: 200,
                  height: 200,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(),
                  ),       
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                  ),       
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'ConfirmPassword',
                    border: const OutlineInputBorder(),
                  ),       
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => registerUser(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Submit Register"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  },
                  child: const Text(
                    "Already have an account? Login Here",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<void>registerUser(BuildContext context) async {
    "hi register";
  }
}