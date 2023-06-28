import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  // Initialize cloud firestore
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Create method to Send Data to Firestore
  addUserDetails({
    required String firstName,
    required String lastname,
    required String email,
  }) async {
    await db.collection("testUser").add({
      'First Name': firstName,
      'Last Name': lastname,
      'Email': email,
    });
  }
}
