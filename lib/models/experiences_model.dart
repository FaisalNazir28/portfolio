class ExperiencesModel {
  String index;
  String uid;
  String title;
  String companyLogo;
  String startDate;
  String endDate;

  ExperiencesModel({
    this.index = "",
    this.uid = "",
    this.title = "",
    this.companyLogo = "",
    this.startDate = "",
    this.endDate = "",
  });

  factory ExperiencesModel.fromJson(dynamic json) {
    if (json != null) {
      final index = json['index'] ?? "";
      final uid = json['uid'] ?? "";
      final title = json['title'] ?? "";
      final companyLogo = json['companyLogo'] ?? "";
      final startDate = json['startDate'] ?? "";
      final endDate = json['endDate'] ?? "";

      return ExperiencesModel(
        index: index,
        uid: uid,
        title: title,
        companyLogo: companyLogo,
        startDate: startDate,
        endDate: endDate,
      );
    }
    return ExperiencesModel();
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'uid': uid,
      'title': title,
      'companyLogo': companyLogo,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
