import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/selected_project_data.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
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

    return Scaffold(
      appBar: const CustomHeader(),
      endDrawer: isMobileScreen
          ? Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Playground'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.playground);
                    },
                  ),
                  ListTile(
                    title: const Text('Services'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.services);
                    },
                  ),
                  ListTile(
                    title: const Text('Case Studies'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.caseStudies);
                    },
                  ),
                  ListTile(
                    title: const Text('About Me'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.about);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.contact);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 200, vertical: 150),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/profiles/faisal.png'),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Hello! I'm Faisal\nNazir",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "A Cross Platform Developer based in\nLahore, Pakistan.",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Passionate creating great applications for production.",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.contact);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Text(
                                      "Talk with me",
                                      style: TextStyle(color: Colors.white),
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
                                        horizontal: 18, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xfff5f5f0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 200, vertical: 150),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Working experience",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ExperienceTile(
                                  companyLogo: "assets/logo/soloinsight.jpeg",
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
                                  companyLogo: "assets/logo/wordpress.png",
                                  title:
                                      "Wordpress Developer at ECOM Technologies",
                                  startDate: "September 2018",
                                  endDate: "October 2018"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Awards & Recognitions",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ExperienceTile(
                                  companyLogo: "assets/logo/pieas1.jpg",
                                  title: "Best Website Design Award by PIEAS",
                                  startDate: "March 2021"),
                              ExperienceTile(
                                  companyLogo: "assets/logo/soloinsight.jpeg",
                                  title:
                                      "Information Security Training by Soloinsight",
                                  startDate: "January 2022"),
                              ExperienceTile(
                                  companyLogo: "assets/logo/soloinsight.jpeg",
                                  title:
                                      "Application Security Training by Soloinsight",
                                  startDate: "April 2023"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xfff5f5f0),
                  child: Container(
                    margin: const EdgeInsets.only(
                        bottom: 150, left: 200, right: 400),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "I CAN HELP YOU WITH",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
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
                const StatsChart(
                  homeScreen: true,
                ),
                Container(
                  color: const Color(0xfff5f5f0),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(200, 150, 200, 150),
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
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
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
                        ),
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
            right: 50,
            bottom: 50,
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
