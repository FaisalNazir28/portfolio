import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/utilities/app_images.dart';
import 'package:my_portfolio/utilities/constants.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/experience_tile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/showcase_container.dart';
import 'dart:html' as html;

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);
    return Scaffold(
      appBar: const CustomHeader(),
      endDrawer: isMobileScreen ? const CustomEndDrawer() : null,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  margin: isDesktopScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .2,
                          vertical: 100)
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                          vertical: 50),
                  child: IntrinsicHeight(
                    child: isDesktopScreen
                        ? Row(
                            children: [
                              const CircleAvatar(
                                radius: 180,
                                backgroundImage:
                                    AssetImage('assets/profiles/faisal.png'),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Faisal Nazir",
                                      style: TextStyle(
                                          fontSize: 65,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    const Text(
                                      "Cross Platform Developer based\nin Lahore, Pakistan.",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    const Text(
                                      "Passionate creating great applications for production.",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54),
                                    ),
                                    Row(
                                      children: [
                                        externalButtons(
                                          link: AppConstants.github,
                                          icon: Ionicons.logo_github,
                                        ),
                                        externalButtons(
                                            icon: Ionicons.logo_bitbucket),
                                        externalButtons(
                                            icon: Ionicons.logo_stackoverflow),
                                        externalButtons(
                                            icon: Ionicons.logo_linkedin),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: isMobileScreen ? 60 : 100,
                                backgroundImage: const AssetImage(
                                    'assets/profiles/faisal.png'),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Faisal Nazir",
                                    style: TextStyle(
                                        fontSize: isMobileScreen ? 45 : 65,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Cross Platform Developer based in Lahore, Pakistan.",
                                    style: TextStyle(
                                        fontSize: isMobileScreen ? 25 : 30,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Passionate creating great applications for production.",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      externalButtons(
                                        link: AppConstants.github,
                                        icon: Ionicons.logo_github,
                                      ),
                                      externalButtons(
                                          icon: Ionicons.logo_bitbucket),
                                      externalButtons(
                                          icon: Ionicons.logo_stackoverflow),
                                      externalButtons(
                                          icon: Ionicons.logo_linkedin),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                  ),
                ),
                Container(
                  color: const Color(0xfff5f5f0),
                  child: Container(
                    margin: isDesktopScreen
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .2,
                            vertical: 120)
                        : EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .04,
                            vertical: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Take a look at my values",
                          style: isMobileScreen
                              ? const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w400)
                              : const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        !isDesktopScreen
                            ? Column(
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        myValues(
                                          icon: CupertinoIcons.star_circle,
                                          title: "Focus on super high-quality",
                                          rightGap: true,
                                        ),
                                        myValues(
                                          icon: CupertinoIcons.square_grid_2x2,
                                          title: "Unique work and all yours",
                                          rightGap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        myValues(
                                          icon: Icons.flash_on_outlined,
                                          title: "Super fast delivery work",
                                          rightGap: true,
                                        ),
                                        myValues(
                                          icon: CupertinoIcons.person_3,
                                          title: "Collaboration number one",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    myValues(
                                      icon: CupertinoIcons.star_circle,
                                      title: "Focus on super high-quality",
                                      rightGap: true,
                                    ),
                                    myValues(
                                      icon: CupertinoIcons.square_grid_2x2,
                                      title: "Unique work and all yours",
                                      rightGap: true,
                                    ),
                                    myValues(
                                      icon: Icons.flash_on_outlined,
                                      title: "Super fast delivery work",
                                      rightGap: true,
                                    ),
                                    myValues(
                                      icon: CupertinoIcons.person_3,
                                      title: "Collaboration number one",
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                const HorizontalScrollBarTile(),
                Container(
                  margin: isDesktopScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .2,
                          vertical: 120,
                        )
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                          vertical: 60),
                  // const EdgeInsets.symmetric(horizontal: 400, vertical: 120),
                  child: isMobileScreen
                      ? Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Experience with a variety\nof Projects and industries.",
                                  style: isMobileScreen
                                      ? const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400)
                                      : const TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  "Verstaile experience across diverse projects and industries,\nbringing adaptability and valuable skills to any task.",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.arrow_down_circle,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Download my CV",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "WORKING EXPERIENCE",
                                  style: isMobileScreen
                                      ? const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)
                                      : const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const ExperienceTile(
                                    companyLogo: "assets/logo/soloinsight.jpeg",
                                    title:
                                        "Flutter Developer at Soloinsight Inc.",
                                    startDate: "March 2020",
                                    endDate: "Present"),
                                const ExperienceTile(
                                    companyLogo: "assets/logo/artache.jfif",
                                    title: "Webmaster at Artache Magazine",
                                    startDate: "July 2023",
                                    endDate: "Present"),
                                const ExperienceTile(
                                    companyLogo: "assets/logo/wordpress.png",
                                    title: "Wordpress Developer at Fiverr",
                                    startDate: "October 2018",
                                    endDate: "Present"),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Experience with a variety\nof Projects and industries.",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Text(
                                    "Versatile experience across diverse projects and industries,\nbringing adaptability and valuable skills to any task.",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        onTap: () {
                                          downloadResume();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.black26,
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons
                                                    .arrow_down_circle,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Download my CV",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "WORKING EXPERIENCE",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  ExperienceTile(
                                      companyLogo:
                                          "assets/logo/soloinsight.jpeg",
                                      title:
                                          "Flutter Developer at Soloinsight Inc.",
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
                        ),
                ),
                Container(
                  margin: isDesktopScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .2,
                          vertical: 120,
                        )
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                          vertical: 60,
                        ),
                  child: Column(
                    children: [
                      isMobileScreen
                          ? Column(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Not only words and stories, the\nawwards that i got have proven.",
                                      style: isMobileScreen
                                          ? const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400)
                                          : const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Text(
                                      "With the awards that i got, it was enough to prove the results of the\nwork that i did.",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Routes.caseStudies);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.black26,
                                              ),
                                            ),
                                            child: const Text(
                                              "See my work",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "AWARDS & RECOGNITION",
                                      style: isMobileScreen
                                          ? const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)
                                          : const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    const ExperienceTile(
                                        companyLogo: "assets/logo/pieas1.jpg",
                                        title:
                                            "Best Website Design Award by PIEAS",
                                        startDate: "March 2021"),
                                    const ExperienceTile(
                                        companyLogo:
                                            "assets/logo/soloinsight.jpeg",
                                        title:
                                            "Information Security Training by Soloinsight",
                                        startDate: "January 2022"),
                                    const ExperienceTile(
                                        companyLogo:
                                            "assets/logo/soloinsight.jpeg",
                                        title:
                                            "Application Security Training by Soloinsight",
                                        startDate: "April 2023"),
                                  ],
                                )
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Not only words and stories, the\nawwards that i got have proven.",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Text(
                                        "With the awards that i got, it was enough to prove the results of the\nwork that i did.",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Routes.caseStudies);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              child: const Text(
                                                "See my work",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "AWARDS & RECOGNITION",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      ExperienceTile(
                                          companyLogo: "assets/logo/pieas1.jpg",
                                          title:
                                              "Best Website Design Award by PIEAS",
                                          startDate: "March 2021"),
                                      ExperienceTile(
                                          companyLogo:
                                              "assets/logo/soloinsight.jpeg",
                                          title:
                                              "Information Security Training by Soloinsight",
                                          startDate: "January 2022"),
                                      ExperienceTile(
                                          companyLogo:
                                              "assets/logo/soloinsight.jpeg",
                                          title:
                                              "Application Security Training by Soloinsight",
                                          startDate: "April 2023"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                      const ShowcaseContainer(
                        title: 'Portfolio Websites',
                        description:
                            'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                        initialIcon: CupertinoIcons.desktopcomputer,
                        firstContainerMainImage: 'assets/showcase/hmk1.png',
                        firstContainerDetailImage: 'assets/showcase/hmk2.png',
                        secondContainerMainImage:
                            'assets/showcase/bridges1.png',
                        secondContainerDetailImage:
                            'assets/showcase/bridges2.png',
                        firstContainerDetailImageBG: Colors.black,
                        secondContainerMainImageBG: Colors.black,
                        secondContainerDetailImageBG: Colors.black,
                        hideTitles: true,
                      ),
                    ],
                  ),
                ),
                myToolsContainer(),
                ReviewWidget(),
                const CustomFooter(),
              ],
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width < 800 ? 25 : 50,
            bottom: MediaQuery.of(context).size.width > 1100 ? 50 : 100,
            child: InkWell(
              onTap: () {
                scrollController.animateTo(0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  CupertinoIcons.up_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openLinkInNewWindows(String link) {
    html.window.open(link, 'new_tab');
  }

  Widget externalButtons({required IconData icon, String? link}) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        if (link!.isNotEmpty) {
          openLinkInNewWindows(link);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black38),
        ),
        child: Icon(icon),
      ),
    );
  }

  Widget myValues({
    required IconData icon,
    required String title,
    bool rightGap = false,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(right: rightGap ? 10 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade200),
              ),
              padding: const EdgeInsets.all(15),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myToolsContainer() {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Some of my tools",
              style: isMobileScreen
                  ? const TextStyle(fontSize: 30, fontWeight: FontWeight.w400)
                  : const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            const Divider(
              height: 50,
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              runSpacing: isDesktopScreen
                  ? 100
                  : isTabletScreen
                      ? 80
                      : 50,
              spacing: isDesktopScreen
                  ? 100
                  : isTabletScreen
                      ? 80
                      : 50,
              children: [
                IconBoxWidget(
                  icon: AppImages.androidStudio,
                  hoverColor: Colors.green,
                ),
                IconBoxWidget(
                  icon: AppImages.xcode,
                  hoverColor: Colors.blue,
                ),
                IconBoxWidget(
                  icon: AppImages.windows,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.windowsColored,
                ),
                IconBoxWidget(
                  icon: AppImages.macos,
                  defaultColor: true,
                  hoverColor: Colors.transparent,
                ),
                IconBoxWidget(
                  icon: AppImages.visualstudio,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.visualstudioColored,
                ),
                IconBoxWidget(
                  icon: AppImages.vscode,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.vscodeColored,
                ),
                IconBoxWidget(
                  icon: AppImages.postman,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.postmanColored,
                ),
                IconBoxWidget(
                  icon: AppImages.flutter,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.flutterColored,
                ),
                IconBoxWidget(
                  icon: AppImages.dart,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.dartColored,
                ),
                IconBoxWidget(
                  icon: AppImages.firebase,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.firebaseColored,
                ),
                IconBoxWidget(
                  icon: AppImages.nodejs,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.nodejsColored,
                ),
                IconBoxWidget(
                  icon: AppImages.javascript,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.javascriptColored,
                ),
                IconBoxWidget(
                  icon: AppImages.sqlite,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.sqliteColored,
                ),
                IconBoxWidget(
                  icon: AppImages.jira,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.jiraColored,
                ),
                IconBoxWidget(
                  icon: AppImages.stackoverflow,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.stackoverflowColored,
                ),
                IconBoxWidget(
                  icon: AppImages.chatGPT,
                  hoverColor: Colors.greenAccent,
                ),
                IconBoxWidget(
                  icon: AppImages.notion,
                  hoverColor: Colors.transparent,
                ),
                IconBoxWidget(
                  icon: AppImages.wordpress,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.wordpressColored,
                ),
                IconBoxWidget(
                  icon: AppImages.elementor,
                  hoverColor: Colors.pink,
                ),
                IconBoxWidget(
                  icon: AppImages.git,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.gitColored,
                ),
                IconBoxWidget(
                  icon: AppImages.github,
                  hoverColor: Colors.transparent,
                ),
                IconBoxWidget(
                  icon: AppImages.bitbucket,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.bitbucketColored,
                ),
                IconBoxWidget(
                  icon: AppImages.appstore,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.appstoreColored,
                ),
                IconBoxWidget(
                  icon: AppImages.playStore,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.playStoreColored,
                ),
                IconBoxWidget(
                  icon: AppImages.chrome,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.chromeColored,
                ),
                IconBoxWidget(
                  icon: AppImages.firefox,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.firefoxColored,
                ),
                IconBoxWidget(
                  icon: AppImages.edge,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.edgeColored,
                ),
                IconBoxWidget(
                  icon: AppImages.adobe,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.adobeColored,
                ),
                IconBoxWidget(
                  icon: AppImages.photoshop,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.photoshopColored,
                ),
                IconBoxWidget(
                  icon: AppImages.adobeXd,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.adobeXdColored,
                ),
                IconBoxWidget(
                  icon: AppImages.figma,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.figmaColored,
                ),
                IconBoxWidget(
                  icon: AppImages.behance,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.behanceColored,
                ),
                IconBoxWidget(
                  icon: AppImages.dribble,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.dribbleColored,
                ),
                IconBoxWidget(
                  icon: AppImages.dropbox,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.dropboxColored,
                ),
                IconBoxWidget(
                  icon: AppImages.linkedin,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.linkedinColored,
                ),
                IconBoxWidget(
                  icon: AppImages.medium,
                  hoverColor: Colors.transparent,
                ),
                IconBoxWidget(
                  icon: AppImages.skype,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.skypeColored,
                ),
                IconBoxWidget(
                  icon: AppImages.slack,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.slackColored,
                ),
                IconBoxWidget(
                  icon: AppImages.discord,
                  hoverColor: Colors.blue.shade800,
                ),
                IconBoxWidget(
                  icon: AppImages.facebook,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.facebookColored,
                ),
                IconBoxWidget(
                  icon: AppImages.instagram,
                  hoverColor: Colors.green,
                  hoveredIcon: AppImages.instagramColored,
                ),
                IconBoxWidget(
                  icon: AppImages.whatsapp,
                  hoverColor: Colors.green,
                ),
              ],
            ),
          ],
        ));
  }

  void downloadResume() {
    html.AnchorElement anchor =
        html.AnchorElement(href: AppConstants.resumeWeb);
    anchor.download = 'Faisal Nazir Resume - Flutter Developer.pdf';
    anchor.click();
  }
}

class IconBoxWidget extends StatefulWidget {
  final String icon;
  final bool defaultColor;
  final Color hoverColor;
  final String hoveredIcon;

  const IconBoxWidget({
    super.key,
    required this.icon,
    this.defaultColor = false,
    required this.hoverColor,
    this.hoveredIcon = '',
  });

  @override
  State<IconBoxWidget> createState() => _IconBoxWidget();
}

class _IconBoxWidget extends State<IconBoxWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {},
      onHover: (value) {
        setState(() {
          if (widget.hoveredIcon.isNotEmpty ||
              widget.hoverColor != Colors.transparent) {
            isHovered = value;
          }
        });
      },
      child: Image.asset(
        widget.hoveredIcon.isNotEmpty && isHovered
            ? widget.hoveredIcon
            : widget.icon,
        width: isDesktopScreen
            ? 60
            : isTabletScreen
                ? 50
                : 35,
        height: isDesktopScreen
            ? 60
            : isTabletScreen
                ? 50
                : 35,
        color: widget.hoveredIcon.isEmpty && isHovered
            ? widget.hoverColor
            : widget.defaultColor == true
                ? null
                : widget.hoveredIcon.isNotEmpty && isHovered
                    ? null
                    : Colors.black87,
      ),
    );
  }
}
