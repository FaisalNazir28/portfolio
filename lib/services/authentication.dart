import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication {
  final auth = FirebaseAuth.instance;

  Future<void> loginUser({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function() onError,
  }) async {
    try {
      final UserCredential credentials = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      debugPrint("Invalid Credentials");
      onError();
    }
  }

  void logOutUser() async {
    await auth.signOut();
  }

  bool userState() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
