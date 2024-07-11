class AwardsModel {
  String index;
  String uid;
  String title;
  String companyLogo;
  String date;

  AwardsModel({
    this.index = "",
    this.uid = "",
    this.title = "",
    this.companyLogo = "",
    this.date = "",
  });

  factory AwardsModel.fromJson(dynamic json) {
    if (json != null) {
      final index = json['index'] ?? "";
      final uid = json['uid'] ?? "";
      final title = json['title'] ?? "";
      final companyLogo = json['companyLogo'] ?? "";
      final date = json['date'] ?? "";

      return AwardsModel(
        index: index,
        uid: uid,
        title: title,
        companyLogo: companyLogo,
        date: date,
      );
    }
    return AwardsModel();
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'uid': uid,
      'title': title,
      'companyLogo': companyLogo,
      'date': date,
    };
  }
}
