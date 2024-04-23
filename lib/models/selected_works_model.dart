class SelectedProjectModel {
  final String imagePath;
  final String title;
  final String company;
  final String monthYear;
  final String description;
  final Function() onTap;

  SelectedProjectModel({
    required this.imagePath,
    required this.title,
    required this.company,
    required this.monthYear,
    required this.description,
    required this.onTap,
  });
}
