import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/stats_model.dart';
import 'package:my_portfolio/services/firebase_collections.dart';

class StatsService {
  static StatsModel statsModel = StatsModel();

  static Future<StatsModel> getStatsData() async {
    DocumentSnapshot querySnapshot =
        await FbCollections.stats.doc('companyStats').get();

    if (querySnapshot.data() != null) {
      Map<String, dynamic> statData =
          querySnapshot.data() as Map<String, dynamic>;
      statsModel = StatsModel.fromJson(statData);
    }
    return statsModel;
  }
}
