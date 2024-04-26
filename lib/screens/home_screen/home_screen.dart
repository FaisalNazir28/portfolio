import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/selected_project_data.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/experience_tile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/selected_work_container.dart';
import 'package:my_portfolio/widgets/showcase_container.dart';
import 'package:my_portfolio/widgets/stats_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);
    var isTablet600to800 = Breakpoints.isTablet600to800(context);
    var isDesktop1200to1300 = Breakpoints.isDesktop1200to1300(context);
    var isDesktop1300to1400 = Breakpoints.isDesktop1300to1400(context);
    var isDesktop1400to1500 = Breakpoints.isDesktop1400to1500(context);
    var isDesktop1500to1600 = Breakpoints.isDesktop1500to1600(context);
    var isDesktop1600to1700 = Breakpoints.isDesktop1600to1700(context);
    var isDesktop1700to1800 = Breakpoints.isDesktop1700to1800(context);
    var isDesktop1800to1900 = Breakpoints.isDesktop1800to1900(context);

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
                          vertical: 150)
                      : isTabletScreen
                          ? EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .1,
                              vertical: 80)
                          : EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .04,
                              vertical: 60),
                  child: isDesktopScreen
                      ? Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        'assets/profiles/faisal.png'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Hello! I'm Faisal Nazir",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: isDesktopScreen
                                        ? const EdgeInsets.only(right: 80)
                                        : null,
                                    child: const Text(
                                      "A Cross Platform Developer based in Lahore, Pakistan.",
                                      style: TextStyle(
                                          fontSize: 33,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Passionate creating great applications for production.",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.contact);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22, vertical: 13),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: const Text(
                                            "Talk with me",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.caseStudies);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22, vertical: 13),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.black26,
                                            ),
                                          ),
                                          child: const Text(
                                            "See my work",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/profiles/faisal.png'),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Hello! I'm Faisal Nazir",
                                  style: TextStyle(
                                      fontSize: isMobileScreen ? 30 : 35,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: isDesktopScreen
                                      ? const EdgeInsets.only(right: 80)
                                      : null,
                                  child: Text(
                                    "A Cross Platform Developer based in Lahore, Pakistan.",
                                    style: TextStyle(
                                        fontSize: isMobileScreen ? 20 : 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Passionate creating great applications for production.",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.contact);
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22, vertical: 13),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: const Text(
                                          "Talk with me",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.caseStudies);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22, vertical: 13),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                        ),
                                        child: const Text(
                                          "See my work",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
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
                            vertical: 150)
                        : isTabletScreen
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 80)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .04,
                                vertical: 60),
                    child: isDesktopScreen
                        ? const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Working experience",
                                      style: TextStyle(
                                          fontSize: 40,
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
                                        companyLogo:
                                            "assets/logo/wordpress.png",
                                        title: "Wordpress Developer at Fiverr",
                                        startDate: "October 2018",
                                        endDate: "Present"),
                                    ExperienceTile(
                                        companyLogo: "assets/logo/gdsc1.webp",
                                        title:
                                            "Google DSC Ambassador at GDSC - PUCIT",
                                        startDate: "October 2021",
                                        endDate: "October 2022"),
                                    ExperienceTile(
                                        companyLogo: "assets/logo/pel1.png",
                                        title: "Android Developer at PEL",
                                        startDate: "October 2018",
                                        endDate: "November 2018"),
                                    ExperienceTile(
                                        companyLogo:
                                            "assets/logo/wordpress.png",
                                        title:
                                            "Wordpress Developer at ECOM Technologies",
                                        startDate: "September 2018",
                                        endDate: "October 2018"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      "Awards & Recognitions",
                                      style: TextStyle(
                                          fontSize: 40,
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
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Working experience",
                                    style: TextStyle(
                                        fontSize: isMobileScreen ? 23 : 40,
                                        fontWeight: isMobileScreen
                                            ? FontWeight.w600
                                            : FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  const ExperienceTile(
                                      companyLogo:
                                          "assets/logo/soloinsight.jpeg",
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
                                  const ExperienceTile(
                                      companyLogo: "assets/logo/gdsc1.webp",
                                      title:
                                          "Google DSC Ambassador at GDSC - PUCIT",
                                      startDate: "October 2021",
                                      endDate: "October 2022"),
                                  const ExperienceTile(
                                      companyLogo: "assets/logo/pel1.png",
                                      title: "Android Developer at PEL",
                                      startDate: "October 2018",
                                      endDate: "November 2018"),
                                  const ExperienceTile(
                                      companyLogo: "assets/logo/wordpress.png",
                                      title:
                                          "Wordpress Developer at ECOM Technologies",
                                      startDate: "September 2018",
                                      endDate: "October 2018"),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Awards & Recognitions",
                                    style: TextStyle(
                                        fontSize: isMobileScreen ? 23 : 40,
                                        fontWeight: isMobileScreen
                                            ? FontWeight.w600
                                            : FontWeight.w500),
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
                          ),
                  ),
                ),
                Container(
                  color: const Color(0xfff5f5f0),
                  child: Container(
                    margin: isDesktopScreen
                        ? EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .2,
                            right: MediaQuery.of(context).size.width * .2,
                            bottom: 150)
                        : isTabletScreen
                            ? EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .1,
                                right: MediaQuery.of(context).size.width * .1,
                                bottom: 80)
                            : EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .04,
                                right: MediaQuery.of(context).size.width * .04,
                                bottom: 60),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "I CAN HELP YOU WITH",
                              style: TextStyle(
                                  fontSize: isMobileScreen ? 25 : 35,
                                  fontWeight: isMobileScreen
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.caseStudies);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff5f5f0),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                ),
                                child: const Text(
                                  "See my work",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
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
                        ),
                        const ShowcaseContainer(
                          title: 'Full pages website design',
                          description:
                              'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                          initialIcon: Icons.desktop_windows_outlined,
                          firstContainerMainImage: 'assets/showcase/art1.png',
                          firstContainerDetailImage: 'assets/showcase/art1.png',
                          secondContainerMainImage:
                              'assets/showcase/barak1.png',
                          secondContainerDetailImage:
                              'assets/showcase/barak2.png',
                        ),
                      ],
                    ),
                  ),
                ),
                const StatsChart(),
                Container(
                  color: const Color(0xfff5f5f0),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: isDesktopScreen
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .2,
                            vertical: 150)
                        : isTabletScreen
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 80)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .04,
                                vertical: 60),
                    child: Column(
                      children: [
                        const Text(
                          "Selected works",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isDesktopScreen ? 2 : 1,
                              childAspectRatio: isDesktopScreen
                                  ? isDesktop1200to1300
                                      ? 0.55
                                      : isDesktop1300to1400
                                          ? 0.60
                                          : isDesktop1400to1500
                                              ? 0.64
                                              : isDesktop1500to1600
                                                  ? 0.69
                                                  : isDesktop1600to1700
                                                      ? 0.74
                                                      : isDesktop1700to1800
                                                          ? 0.79
                                                          : isDesktop1800to1900
                                                              ? 0.84
                                                              : 0.88
                                  : isTabletScreen
                                      ? isTablet600to800
                                          ? 1.5
                                          : 2.3
                                      : MediaQuery.of(context).size.width <= 500
                                          ? 0.75
                                          : 0.82,
                              crossAxisSpacing: 50.0,
                              mainAxisSpacing: 50.0,
                            ),
                            itemCount:
                                SelectedProjectData.selectedProjects.length,
                            itemBuilder: (context, index) {
                              return SelectedWorkContainer(
                                  projectData: SelectedProjectData
                                      .selectedProjects[index]);
                            }),
                      ],
                    ),
                  ),
                ),
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
}
