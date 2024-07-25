import 'package:my_portfolio/models/stats_model.dart';

class StatsController {
  static StatsModel statsModel = StatsModel();

  Future<void> getAllStats() async {
    // statsModel = await StatsService().getStatsData();
  }
}
