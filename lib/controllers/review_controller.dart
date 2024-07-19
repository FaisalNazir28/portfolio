import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/reviews_model.dart';
import 'package:my_portfolio/services/firebase_collections.dart';

class ReviewController {
  Future<List<ReviewsModel>> getAllReviews() async {
    List<ReviewsModel> allReviews = List<ReviewsModel>.empty(growable: true);
    QuerySnapshot querySnapshot = await FbCollections.clientReviews.get();

    if (querySnapshot.size > 0) {
      allReviews = querySnapshot.docs
          .map((doc) => ReviewsModel.fromJson(doc.data()))
          .toList();
    }
    return allReviews;
  }
}
