import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class FbCollections {
  static CollectionReference users = db.collection("users");
}
