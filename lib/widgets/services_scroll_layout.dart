import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/experience_tile.dart';

class ServicesScrollLayout extends StatefulWidget {
  ScrollController _textController;
  ScrollController _columnController;
  bool _freezeText = false;

  ServicesScrollLayout(
      this._textController, this._columnController, this._freezeText);

  @override
  State<ServicesScrollLayout> createState() => _ServicesScrollLayoutState();
}

class _ServicesScrollLayoutState extends State<ServicesScrollLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text Section
        Expanded(
          child: SingleChildScrollView(
            controller: widget._textController,
            physics: widget._freezeText ? NeverScrollableScrollPhysics() : null,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                // Your 5 lines of text here
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              ),
            ),
          ),
        ),
        // Column Section
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView(
            controller: widget._columnController,
            padding: EdgeInsets.all(16.0),
            children: [
              ExperienceTile(
                  companyLogo: "assets/logo/soloinsight.jpeg",
                  title: "Flutter Developer at Soloinsight Inc.",
                  startDate: "March 2020",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/artache.jfif",
                  title: "Webmaster at Artache Magazine",
                  startDate: "July 2023",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/wordpress.png",
                  title: "Wordpress Developer at Fiverr",
                  startDate: "October 2018",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/soloinsight.jpeg",
                  title: "Flutter Developer at Soloinsight Inc.",
                  startDate: "March 2020",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/artache.jfif",
                  title: "Webmaster at Artache Magazine",
                  startDate: "July 2023",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/wordpress.png",
                  title: "Wordpress Developer at Fiverr",
                  startDate: "October 2018",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/soloinsight.jpeg",
                  title: "Flutter Developer at Soloinsight Inc.",
                  startDate: "March 2020",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/artache.jfif",
                  title: "Webmaster at Artache Magazine",
                  startDate: "July 2023",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/wordpress.png",
                  title: "Wordpress Developer at Fiverr",
                  startDate: "October 2018",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/soloinsight.jpeg",
                  title: "Flutter Developer at Soloinsight Inc.",
                  startDate: "March 2020",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/artache.jfif",
                  title: "Webmaster at Artache Magazine",
                  startDate: "July 2023",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/wordpress.png",
                  title: "Wordpress Developer at Fiverr",
                  startDate: "October 2018",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/soloinsight.jpeg",
                  title: "Flutter Developer at Soloinsight Inc.",
                  startDate: "March 2020",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/artache.jfif",
                  title: "Webmaster at Artache Magazine",
                  startDate: "July 2023",
                  endDate: "Present"),
              ExperienceTile(
                  companyLogo: "assets/logo/wordpress.png",
                  title: "Wordpress Developer at Fiverr",
                  startDate: "October 2018",
                  endDate: "Present"),
            ],
          ),
        ),
      ],
    );
  }
}
