class ExperiencesModel {
  String index;
  String uid;
  String title;
  String companyLogo;
  String startDate;
  String endData;

  ExperiencesModel({
    this.index = "",
    this.uid = "",
    this.title = "",
    this.companyLogo = "",
    this.startDate = "",
    this.endData = "",
  });

  factory ExperiencesModel.fromJson(dynamic json) {
    if (json != null) {
      final index = json['index'] ?? "";
      final uid = json['uid'] ?? "";
      final title = json['title'] ?? "";
      final companyLogo = json['companyLogo'] ?? "";
      final startDate = json['startDate'] ?? "";
      final endData = json['endData'] ?? "";

      return ExperiencesModel(
        index: index,
        uid: uid,
        title: title,
        companyLogo: companyLogo,
        startDate: startDate,
        endData: endData,
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
      'endData': endData,
    };
  }
}
