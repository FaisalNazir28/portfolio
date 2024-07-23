import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/projects_model.dart';
import 'package:my_portfolio/services/firebase_collections.dart';

class ProjectsController {
  static Future<List<ProjectsModel>> getAllProjects() async {
    List<ProjectsModel> allProjects = List<ProjectsModel>.empty(growable: true);
    QuerySnapshot querySnapshot = await FbCollections.projects.get();

    if (querySnapshot.size > 0) {
      allProjects = querySnapshot.docs
          .map((doc) => ProjectsModel.fromJson(doc.data()))
          .toList();
    }
    return allProjects;
  }

  static Future<List<ProjectsModel>> getWebProjects() async {
    List<ProjectsModel> webProjects = List<ProjectsModel>.empty(growable: true);
    QuerySnapshot querySnapshot = await FbCollections.projects.get();

    if (querySnapshot.size > 0) {
      webProjects = querySnapshot.docs
          .map((doc) => ProjectsModel.fromJson(doc.data()))
          .where((e) => e.projectPlatform == "Web")
          .toList();
    }
    return webProjects;
  }

  static Future<List<ProjectsModel>> getMobileProjects() async {
    List<ProjectsModel> mobileProjects =
        List<ProjectsModel>.empty(growable: true);
    QuerySnapshot querySnapshot = await FbCollections.projects.get();

    if (querySnapshot.size > 0) {
      mobileProjects = querySnapshot.docs
          .map((doc) => ProjectsModel.fromJson(doc.data()))
          .where((e) => e.projectPlatform == "Mobile")
          .toList();
    }
    return mobileProjects;
  }

  static Future<List<ProjectsModel>> getHybridProjects() async {
    List<ProjectsModel> hybridProjects =
        List<ProjectsModel>.empty(growable: true);
    QuerySnapshot querySnapshot = await FbCollections.projects.get();

    if (querySnapshot.size > 0) {
      hybridProjects = querySnapshot.docs
          .map((doc) => ProjectsModel.fromJson(doc.data()))
          .where((e) => e.projectPlatform == "Hybrid")
          .toList();
    }
    return hybridProjects;
  }
}