class StatsModel {
  String applicationsBuilt;
  String happyClients;
  String projectsFinished;
  String recognitions;
  String websitesDeveloped;
  String yearsExperience;

  StatsModel({
    this.applicationsBuilt = "",
    this.happyClients = "",
    this.projectsFinished = "",
    this.recognitions = "",
    this.websitesDeveloped = "",
    this.yearsExperience = "",
  });

  factory StatsModel.fromJson(dynamic json) {
    if (json != null) {
      final applicationsBuilt = json['applicationsBuilt'] ?? "";
      final happyClients = json['happyClients'] ?? "";
      final projectsFinished = json['projectsFinished'] ?? "";
      final recognitions = json['recognitions'] ?? "";
      final websitesDeveloped = json['websitesDeveloped'] ?? "";
      final yearsExperience = json['yearsExperience'] ?? "";

      return StatsModel(
        applicationsBuilt: applicationsBuilt,
        happyClients: happyClients,
        projectsFinished: projectsFinished,
        recognitions: recognitions,
        websitesDeveloped: websitesDeveloped,
        yearsExperience: yearsExperience,
      );
    }
    return StatsModel();
  }

  Map<String, dynamic> toJson() {
    return {
      'applicationsBuilt': applicationsBuilt,
      'happyClients': happyClients,
      'projectsFinished': projectsFinished,
      'recognitions': recognitions,
      'websitesDeveloped': websitesDeveloped,
      'yearsExperience': yearsExperience,
    };
  }
}
