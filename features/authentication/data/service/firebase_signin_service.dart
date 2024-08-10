import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseSignInService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
        );
    }
    catch (e) {
      debugPrint("*** Chouaib there is an error in FirebaseSignInService ***");
      rethrow;
    }
  }

}