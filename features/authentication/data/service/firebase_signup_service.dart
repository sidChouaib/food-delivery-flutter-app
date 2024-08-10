import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSignUpService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } catch (e) {
      // Handle signup failure (e.g., email is already in use)
      print("***** Chouaib, An error occured in firebase_signup service*****");
      rethrow; // You can handle the exception here or log it for debugging
    }
  }

  Future<void> storeUserInfos({
    required UserCredential userCredential,
    required String fullName,
    required int age,
    required int phoneNumber,
    required String email,
    required String password,
  }) async {
    final String userId = userCredential.user!.uid;
    await _firestore.collection("users").doc(userId).set({
      'fullName': fullName,
      'age': age,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    });
  }
}
