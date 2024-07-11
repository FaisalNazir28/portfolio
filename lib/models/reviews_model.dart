class ReviewsModel {
  String index;
  String projectUID;
  String clientName;
  String clientPicture;
  String clientDesignation;
  String clientCompany;
  String clientReview;

  ReviewsModel({
    this.index = "",
    this.projectUID = "",
    this.clientName = "",
    this.clientPicture = "",
    this.clientDesignation = "",
    this.clientCompany = "",
    this.clientReview = "",
  });

  factory ReviewsModel.fromJson(dynamic json) {
    if (json != null) {
      final index = json['index'] ?? "";
      final projectUID = json['projectUID'] ?? "";
      final clientName = json['clientName'] ?? "";
      final clientPicture = json['clientPicture'] ?? "";
      final clientDesignation = json['clientDesignation'] ?? "";
      final clientCompany = json['clientCompany'] ?? "";
      final clientReview = json['clientReview'] ?? "";

      return ReviewsModel(
        index: index,
        projectUID: projectUID,
        clientName: clientName,
        clientPicture: clientPicture,
        clientDesignation: clientDesignation,
        clientCompany: clientCompany,
        clientReview: clientReview,
      );
    }
    return ReviewsModel();
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'projectUID': projectUID,
      'clientName': clientName,
      'clientPicture': clientPicture,
      'clientDesignation': clientDesignation,
      'clientCompany': clientCompany,
      'clientReview': clientReview,
    };
  }
}
