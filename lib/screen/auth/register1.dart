import 'package:flutter/material.dart';
import '../../utils/https.dart';
import '../auth/login.dart';
import 'register2.dart';

class Register1Screen extends StatefulWidget {
  @override
  Register1ScreenState createState() => Register1ScreenState();
}

class Register1ScreenState extends State<Register1Screen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/rentrealm_logo.png",
                width: 200,
                height: 200,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => registerUser(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
        ),
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    final response = await apiService.registerUser(
      name: name,
      email: email,
      password: password,
      // role: 'tenant', // Change this role as needed
    );
    
    if (response != null && response.success) {

      final token = response.data?.token ?? '';
      print('token : ${token}');
      final userid = response.data?.user.id ?? 0;
      print('user id : ${userid}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful: ${response.message}')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen()),
        // MaterialPageRoute(
        //   builder: (context) => Register2Screen(
        //     userId : userid,
        //     name : name,
        //     email : email,
        //     token : token,
        // )),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Failed: ${response?.message}')),
      );
    }
  }
}
