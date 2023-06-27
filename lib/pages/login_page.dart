import 'package:flutter/material.dart';

import '../widgets/submit_button.dart';
import '../widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.changePage});
  final void Function() changePage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initialize Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // Android Logo
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Icon(
                  Icons.android,
                  size: 100,
                ),
              ),

              // Text Dispaly : Hello Again
              const Text(
                "Hello Again!",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 20,
              ),

              // Text Dispaly : Welcome
              const Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              // Email Input Field
              InputField(
                hintText: "Email",
                hideText: false,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  } else if (!value.contains("@")) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 5,
              ),

              // Password Input Field
              InputField(
                hintText: "Password",
                hideText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 30,
              ),

              // Sign In Button
              SubmitButton(
                text: "Sign In",
                onTap: () {
                  if (_formkey.currentState!.validate()) {}
                },
              ),

              const SizedBox(
                height: 30,
              ),

              // Text : Not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: widget.changePage,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
