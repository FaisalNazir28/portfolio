import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/detailed_showcase_container.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/stats_chart.dart';

class CaseStudiesScreen extends StatefulWidget {
  const CaseStudiesScreen({super.key});

  @override
  State<CaseStudiesScreen> createState() => _CaseStudiesScreenState();
}

class _CaseStudiesScreenState extends State<CaseStudiesScreen> {
  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Scaffold(
      appBar: const CustomHeader(),
      endDrawer: isMobileScreen ? const CustomEndDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: isDesktopScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2,
                      vertical: 100)
                  : isTabletScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .1,
                          vertical: 100)
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                          vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Journey Through Our Cross Platform Projects",
                    style: isDesktopScreen
                        ? const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)
                        : isTabletScreen
                            ? const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)
                            : const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                  ),
                  if (!isDesktopScreen)
                    const SizedBox(
                      height: 10,
                    ),
                  const Text(
                    "Embark on a visual odyssey as we showcase the culmination of our expertise, creativity, and technical finesse in a diverse array of cross platform projects that redefine digital possibilities.",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xfff5f5f0),
              child: Container(
                margin: isDesktopScreen
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .2,
                        vertical: 100)
                    : isTabletScreen
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .1,
                            vertical: 100)
                        : EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .04,
                            vertical: 100),
                child: const Column(
                  children: [
                    DetailedShowcaseContainer(
                      title: "Struktura",
                      description:
                          "Explore our extensive portfolio for a glimpse into seamless digital solutions that elevate online experiences. I ensures your presence is not just noticed but remembered",
                      clientName: 'Construction Company',
                      projectDate: 'April 2023',
                      projectType: 'Website development',
                      projectDuration: '2 Months',
                      firstImage: 'assets/showcase/art1.png',
                      secondImage: 'assets/showcase/hmk1.png',
                      thirdImage: 'assets/showcase/hmk2.png',
                      thirdImageBG: Colors.black,
                      initialContainer: true,
                    ),
                    DetailedShowcaseContainer(
                      title: "Artache Magazine",
                      description:
                          "Explore our extensive portfolio for a glimpse into seamless digital solutions that elevate online experiences. I ensures your presence is not just noticed but remembered",
                      clientName: 'Digital Magazine',
                      projectDate: 'June 2023',
                      projectType: 'Website development',
                      projectDuration: '4 Months',
                      firstImage: 'assets/showcase/art1.png',
                      secondImage: 'assets/showcase/art2.png',
                      thirdImage: 'assets/showcase/barak2.png',
                      thirdImageBG: Colors.black,
                    ),
                    DetailedShowcaseContainer(
                      title: "Portfolio Website",
                      description:
                          "Explore our extensive portfolio for a glimpse into seamless digital solutions that elevate online experiences. I ensures your presence is not just noticed but remembered",
                      clientName: 'HMK',
                      projectDate: 'April 2022',
                      projectType: 'Website development',
                      projectDuration: '3 Months',
                      firstImage: 'assets/showcase/hmk1.png',
                      secondImage: 'assets/showcase/hmk2.png',
                      thirdImage: 'assets/showcase/bridges2.png',
                      thirdImageBG: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const StatsChart(showWorkButton: false),
            ReviewWidget(defaultColor: false),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
