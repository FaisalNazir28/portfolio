import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/experiences_model.dart';
import 'package:my_portfolio/services/firebase_collections.dart';

class ExperiencesController {
  Future<List<ExperiencesModel>> getAllExperiences() async {
    List<ExperiencesModel> allExperiences =
        List<ExperiencesModel>.empty(growable: true);
    QuerySnapshot querySnapshot = await FbCollections.experiences.get();

    if (querySnapshot.size > 0) {
      allExperiences = querySnapshot.docs
          .map((doc) => ExperiencesModel.fromJson(doc.data()))
          .toList();
    }
    return allExperiences;
  }
}
