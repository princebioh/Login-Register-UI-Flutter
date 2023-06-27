import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register_ui/services/authentication/email_auth.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Logged In"),
        actions: [
          IconButton(
            onPressed: () {
              EmailAuthenticate().logOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Logged In : ${FirebaseAuth.instance.currentUser!.email}",
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
