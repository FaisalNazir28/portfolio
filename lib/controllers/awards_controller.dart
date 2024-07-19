import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/awards_model.dart';
import 'package:my_portfolio/services/firebase_collections.dart';

class AwardsController {
  Future<List<AwardsModel>> getAllAwards() async {
    List<AwardsModel> allAwards = List<AwardsModel>.empty(growable: true);
    QuerySnapshot querySnapshot =
        await FbCollections.awardsAndRecognitions.get();

    if (querySnapshot.size > 0) {
      allAwards = querySnapshot.docs
          .map((doc) => AwardsModel.fromJson(doc.data()))
          .toList();
    }
    return allAwards;
  }
}
