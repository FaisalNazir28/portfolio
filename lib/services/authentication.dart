import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_portfolio/models/user_model.dart';

class Authentication {
  final auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

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
      onError();
    }
  }

  Future<void> registerUser() async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: 'dummy@123.com', password: '123456789');

    if (userCredential.user != null) {
      var userID = await auth.currentUser!.uid;
      _fireStore.collection('users').doc(userID).set(UserModel(
            uid: userID,
            email: "dummy@123.com",
            name: "Dummy Me",
            phone: "555-555-555",
            designation: "Robot",
            company: "Anonymous",
            isActive: false,
            isAdmin: true,
          ).toJson());
    } else {
      print("User not created!");
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
