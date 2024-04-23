import 'package:my_portfolio/models/selected_works_model.dart';

class SelectedProjectData {
  static List<SelectedProjectModel> selectedProjects = [
    SelectedProjectModel(
        imagePath: 'assets/showcase/hmk1.png',
        title: '10thbit',
        company: 'Software Company',
        monthYear: 'March 2023',
        description: 'description',
        onTap: (){}),
    SelectedProjectModel(
        imagePath: 'assets/showcase/art1.png',
        title: 'Artache Magazine',
        company: 'Digital Magazine',
        monthYear: 'September 2023',
        description: 'description',
        onTap: (){}),
    SelectedProjectModel(
        imagePath: 'assets/showcase/bridges1.png',
        title: 'Bridges Interactive',
        company: 'Gaming Portfolio',
        monthYear: 'January 2022',
        description: 'description',
        onTap: (){}),
    SelectedProjectModel(
        imagePath: 'assets/showcase/barak1.png',
        title: 'Barak IP',
        company: 'Intellectual Law Firm',
        monthYear: 'October 2021',
        description: 'description',
        onTap: (){}),
  ];
}