import 'package:flutter/material.dart';
import '../widgets/submit_button.dart';
import '../widgets/text_input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.changePage});
  final void Function() changePage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Initialize Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),

              // Text Dispaly : Hello
              const Text(
                "Hello There!",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 15,
              ),

              // Text Dispaly : Welcome
              const Text(
                "Register below with your details ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // First Name
              InputField(
                hintText: "First Name",
                hideText: false,
                controller: _firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
              ),

              // Last Name
              InputField(
                hintText: "Last Name",
                hideText: false,
                controller: _lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  }
                  return null;
                },
              ),

              // Email Input Field
              InputField(
                hintText: "Email",
                hideText: false,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter valid Email";
                  } else if (!value.contains("@")) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
              ),

              // Password Input Field
              InputField(
                hintText: "Password",
                hideText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Password";
                  }
                  return null;
                },
              ),

              // Confirm Password
              InputField(
                hintText: "Confirm Password",
                hideText: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password Again";
                  } else if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 30,
              ),

              // Sign In Button
              SubmitButton(
                  text: "Register",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  }),

              const SizedBox(
                height: 30,
              ),

              // Text : Not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a member?",
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
                      "Login Here",
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
