import 'package:flutter/material.dart';
import '../../components/alertutils.dart';
import '../../utils/https.dart';
import './register1.dart';
import '../home.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: 'test@test.com');
  final TextEditingController passwordController = TextEditingController(text: 'password');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final apiService = ApiService();

  bool isLoading = false;
  String? emailError;
  String? passwordError;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        title: const Text("Login"),
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
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => loginUser(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Login"),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register1Screen()),
                  );
                },
                child: const Text(
                  "Don't have an account? Register Here",
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

  Future<void> loginUser(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text;
    final password = passwordController.text;

    setState(() {
      isLoading = true;
    });

    try {
      // Call your API service here to perform login
      final response = await apiService.loginUser(
        email: email,
        password: password,
      );

      setState(() {
        isLoading = false;
      });

      if (response != null && response.success) {
        AlertUtils.showSuccessAlert(
          context,
          title: 'Login Successful',
          message: response.message ?? 'Welcome!',
        );

        // Delay navigation to let the alert display momentarily
        await Future.delayed(const Duration(seconds: 1));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userId: response.data?.user.id ?? 0,
              name: response.data?.user.name ?? '',
              email: email,
              token: response.data?.token ?? '',
            ),
          ),
        );
      } else {
        AlertUtils.showErrorAlert(
          context,
          title: 'Login Failed',
          message: response?.message ?? 'Invalid credentials or network issue.',
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      // Display an error alert for unexpected exceptions
      AlertUtils.showErrorAlert(
        context,
        title: 'Error',
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }
}
