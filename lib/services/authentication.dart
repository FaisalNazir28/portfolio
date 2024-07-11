import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/models/user_model.dart';
import 'package:my_portfolio/services/firebase_collections.dart';

class Authentication {
  final auth = FirebaseAuth.instance;
  static UserModel userModel = UserModel();

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
      await getData(credentials.user!.uid);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError();
    }
  }

  Future<void> registerUser(UserModel userModel) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: 'dummy@123.com', password: '123456789');

    if (userCredential.user != null) {
      var userID = await auth.currentUser!.uid;
      FbCollections.users.doc(userModel.uid).set(userModel.toJson());
    } else {
      print("User not created!");
    }
  }

  Future<void> getData(String uid) async {
    await FbCollections.users.doc(uid).get().then((DocumentSnapshot ds) {
      userModel = UserModel.fromJson(ds.data() as Map<String, dynamic>);
    }, onError: (e) => debugPrint("Error fetching Data: $e"));
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
