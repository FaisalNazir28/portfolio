import 'dart:ui';

class SelectedProjectModel {
  final int index;
  final String mainImage;
  final String secondImage;
  final String thirdImage;
  final Color? mainImageBG;
  final Color? secondImageBG;
  final Color? thirdImageBG;
  final String title;
  final String company;
  final String projectDate;
  final String projectType;
  final String projectDuration;
  final String shortBio;
  final String description;
  final String challengesFaced;
  final String results;
  final String extraImage1;
  final String extraImage2;
  final String extraImage3;
  final String mobileView;

  SelectedProjectModel({
    required this.index,
    required this.mainImage,
    required this.secondImage,
    required this.thirdImage,
    required this.mainImageBG,
    required this.secondImageBG,
    required this.thirdImageBG,
    required this.title,
    required this.company,
    required this.projectDate,
    required this.projectType,
    required this.projectDuration,
    required this.shortBio,
    required this.description,
    required this.challengesFaced,
    required this.results,
    required this.extraImage1,
    required this.extraImage2,
    required this.extraImage3,
    required this.mobileView,
  });
}
