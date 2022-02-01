import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireAuth {
  static Future<User?> registerUsingEmailPassword({
    name,
    required String email,
    required String password,
    required method,
    required chemin,
    required context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await method(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (name != null) {
        user?.updateDisplayName(name);
        // await user?.updateDisplayName(name);
        user?.reload();
        user = auth.currentUser;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => chemin,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
