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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
            ),

            // Last Name
            InputField(
              hintText: "Last Name",
              hideText: false,
              controller: _lastNameController,
            ),

            // Email Input Field
            InputField(
              hintText: "Email",
              hideText: false,
              controller: _emailController,
            ),

            // Password Input Field
            InputField(
              hintText: "Password",
              hideText: true,
              controller: _passwordController,
            ),

            // Confirm Password
            InputField(
              hintText: "Confirm Password",
              hideText: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(
              height: 30,
            ),

            // Sign In Button
            SubmitButton(
              text: "Register",
              onTap: () {},
            ),

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
      )),
    );
  }
}
