class ProjectsModel {
  String projectIndex;
  String clientUID;
  String projectUID;
  String clientName;
  String clientCompany;
  String projectName;
  String projectPlatform;
  String projectShortBio;
  String projectDescription;
  String projectDate;
  String projectType;
  String projectDuration;
  String projectBudget;
  String projectChallengesFaced;
  String projectResultsAndImpacts;
  String projectStatus;
  String mainImageBG;
  String secondImageBG;
  String thirdImageBG;
  String mainImage;
  String secondImage;
  String thirdImage;
  String extraImage1;
  String extraImage2;
  String extraImage3;
  String extraImage4;
  String extraImage5;
  String extraImage6;
  String extraImage7;
  String extraImage8;
  String extraImage9;
  String extraImage10;
  String extraImage11;
  String extraImage12;
  String extraImage13;
  String extraImage14;
  String extraImage15;
  String extraImage16;
  String extraImage17;
  String mobileView;
  String likesCount;
  String starsCount;
  String loveCount;
  String appIcon;
  bool iconPadding;
  String appThemeColor;
  bool builtForAndroid;
  bool builtForApple;
  bool projectIsCompleted;
  String clientReview;

  ProjectsModel({
    this.projectIndex = "",
    this.clientUID = "",
    this.projectUID = "",
    this.clientName = "",
    this.clientCompany = "",
    this.projectName = "",
    this.projectPlatform = "",
    this.projectShortBio = "",
    this.projectDescription = "",
    this.projectDate = "",
    this.projectType = "",
    this.projectDuration = "",
    this.projectBudget = "",
    this.projectChallengesFaced = "",
    this.projectResultsAndImpacts = "",
    this.projectStatus = "",
    this.mainImageBG = "",
    this.secondImageBG = "",
    this.thirdImageBG = "",
    this.mainImage = "",
    this.secondImage = "",
    this.thirdImage = "",
    this.extraImage1 = "",
    this.extraImage2 = "",
    this.extraImage3 = "",
    this.extraImage4 = "",
    this.extraImage5 = "",
    this.extraImage6 = "",
    this.extraImage7 = "",
    this.extraImage8 = "",
    this.extraImage9 = "",
    this.extraImage10 = "",
    this.extraImage11 = "",
    this.extraImage12 = "",
    this.extraImage13 = "",
    this.extraImage14 = "",
    this.extraImage15 = "",
    this.extraImage16 = "",
    this.extraImage17 = "",
    this.mobileView = "",
    this.likesCount = "",
    this.starsCount = "",
    this.loveCount = "",
    this.appIcon = "",
    this.iconPadding = true,
    this.appThemeColor = "",
    this.builtForAndroid = true,
    this.builtForApple = false,
    this.projectIsCompleted = false,
    this.clientReview = "",
  });

  factory ProjectsModel.fromJson(dynamic json) {
    if (json != null) {
      final projectIndex = json['projectIndex'] ?? "";
      final clientUID = json['clientUID'] ?? "";
      final projectUID = json['projectUID'] ?? "";
      final clientName = json['clientName'] ?? "";
      final clientCompany = json['clientCompany'] ?? "";
      final projectName = json['projectName'] ?? "";
      final projectPlatform = json['projectPlatform'] ?? "";
      final projectShortBio = json['projectShortBio'] ?? "";
      final projectDescription = json['projectDescription'] ?? "";
      final projectDate = json['projectDate'] ?? "";
      final projectType = json['projectType'] ?? "";
      final projectDuration = json['projectDuration'] ?? "";
      final projectBudget = json['projectBudget'] ?? "";
      final projectChallengesFaced = json['projectChallengesFaced'] ?? "";
      final projectResultsAndImpacts = json['projectResultsAndImpacts'] ?? "";
      final projectStatus = json['projectStatus'] ?? "";
      final mainImageBG = json['mainImageBG'] ?? "";
      final secondImageBG = json['secondImageBG'] ?? "";
      final thirdImageBG = json['thirdImageBG'] ?? "";
      final mainImage = json['mainImage'] ?? "";
      final secondImage = json['secondImage'] ?? "";
      final thirdImage = json['thirdImage'] ?? "";
      final extraImage1 = json['extraImage1'] ?? "";
      final extraImage2 = json['extraImage2'] ?? "";
      final extraImage3 = json['extraImage3'] ?? "";
      final extraImage4 = json['extraImage4'] ?? "";
      final extraImage5 = json['extraImage5'] ?? "";
      final extraImage6 = json['extraImage6'] ?? "";
      final extraImage7 = json['extraImage7'] ?? "";
      final extraImage8 = json['extraImage8'] ?? "";
      final extraImage9 = json['extraImage9'] ?? "";
      final extraImage10 = json['extraImage10'] ?? "";
      final extraImage11 = json['extraImage11'] ?? "";
      final extraImage12 = json['extraImage12'] ?? "";
      final extraImage13 = json['extraImage13'] ?? "";
      final extraImage14 = json['extraImage14'] ?? "";
      final extraImage15 = json['extraImage15'] ?? "";
      final extraImage16 = json['extraImage16'] ?? "";
      final extraImage17 = json['extraImage17'] ?? "";
      final mobileView = json['mobileView'] ?? "";
      final likesCount = json['likesCount'] ?? "";
      final starsCount = json['starsCount'] ?? "";
      final loveCount = json['loveCount'] ?? "";
      final appIcon = json['appIcon'] ?? "";
      final iconPadding = json['iconPadding'] ?? false;
      final appThemeColor = json['appThemeColor'] ?? "";
      final builtForAndroid = json['builtForAndroid'] ?? true;
      final builtForApple = json['builtForApple'] ?? false;
      final projectIsCompleted = json['projectIsCompleted'] ?? false;
      final clientReview = json['clientReview'] ?? "";

      return ProjectsModel(
        projectIndex: projectIndex,
        clientUID: clientUID,
        projectUID: projectUID,
        clientName: clientName,
        clientCompany: clientCompany,
        projectName: projectName,
        projectPlatform: projectPlatform,
        projectShortBio: projectShortBio,
        projectDescription: projectDescription,
        projectDate: projectDate,
        projectType: projectType,
        projectDuration: projectDuration,
        projectBudget: projectBudget,
        projectChallengesFaced: projectChallengesFaced,
        projectResultsAndImpacts: projectResultsAndImpacts,
        projectStatus: projectStatus,
        mainImageBG: mainImageBG,
        secondImageBG: secondImageBG,
        thirdImageBG: thirdImageBG,
        mainImage: mainImage,
        secondImage: secondImage,
        thirdImage: thirdImage,
        extraImage1: extraImage1,
        extraImage2: extraImage2,
        extraImage3: extraImage3,
        extraImage4: extraImage4,
        extraImage5: extraImage5,
        extraImage6: extraImage6,
        extraImage7: extraImage7,
        extraImage8: extraImage8,
        extraImage9: extraImage9,
        extraImage10: extraImage10,
        extraImage11: extraImage11,
        extraImage12: extraImage12,
        extraImage13: extraImage13,
        extraImage14: extraImage14,
        extraImage15: extraImage15,
        extraImage16: extraImage16,
        extraImage17: extraImage17,
        mobileView: mobileView,
        likesCount: likesCount,
        starsCount: starsCount,
        loveCount: loveCount,
        appIcon: appIcon,
        iconPadding: iconPadding,
        appThemeColor: appThemeColor,
        builtForAndroid: builtForAndroid,
        builtForApple: builtForApple,
        projectIsCompleted: projectIsCompleted,
        clientReview: clientReview,
      );
    }
    return ProjectsModel();
  }

  Map<String, dynamic> toJson() {
    return {
      'projectIndex': projectIndex,
      'clientUID': clientUID,
      'projectUID': projectUID,
      'clientName': clientName,
      'clientCompany': clientCompany,
      'projectName': projectName,
      'projectPlatform': projectPlatform,
      'projectShortBio': projectShortBio,
      'projectDescription': projectDescription,
      'projectDate': projectDate,
      'projectType': projectType,
      'projectDuration': projectDuration,
      'projectBudget': projectBudget,
      'projectChallengesFaced': projectChallengesFaced,
      'projectResultsAndImpacts': projectResultsAndImpacts,
      'projectStatus': projectStatus,
      'mainImageBG': mainImageBG,
      'secondImageBG': secondImageBG,
      'thirdImageBG': thirdImageBG,
      'mainImage': mainImage,
      'secondImage': secondImage,
      'thirdImage': thirdImage,
      'extraImage1': extraImage1,
      'extraImage2': extraImage2,
      'extraImage3': extraImage3,
      'extraImage4': extraImage4,
      'extraImage5': extraImage5,
      'extraImage6': extraImage6,
      'extraImage7': extraImage7,
      'extraImage8': extraImage8,
      'extraImage9': extraImage9,
      'extraImage10': extraImage10,
      'extraImage11': extraImage11,
      'extraImage12': extraImage12,
      'extraImage13': extraImage13,
      'extraImage14': extraImage14,
      'extraImage15': extraImage15,
      'extraImage16': extraImage16,
      'extraImage17': extraImage17,
      'mobileView': mobileView,
      'likesCount': likesCount,
      'starsCount': starsCount,
      'loveCount': loveCount,
      'appIcon': appIcon,
      'iconPadding': iconPadding,
      'appThemeColor': appThemeColor,
      'builtForAndroid': builtForAndroid,
      'builtForApple': builtForApple,
      'projectIsCompleted': projectIsCompleted,
      'clientReview': clientReview,
    };
  }
}