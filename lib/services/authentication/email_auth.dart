import 'package:firebase_auth/firebase_auth.dart';

// Email & Password Authentication Methods

class EmailAuthenticate {
  // Initialize FirebaseAuth Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create Method to Login
  Future<void> emailLogIn({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Create Method to Register
  Future<void> emailSignUp({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Forgot Password Method
  Future<void> forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // Create Method to LogOut
  Future<void> logOut() async {
    _auth.signOut();
  }
}
