import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/controllers/projects_controller.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/models/projects_model.dart';
import 'package:my_portfolio/models/selected_project_data.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/detailed_showcase_container.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/stats_chart.dart';
import 'package:segmented_button_slide/segmented_button_slide.dart';

class CaseStudiesScreen extends StatefulWidget {
  const CaseStudiesScreen({super.key});

  @override
  State<CaseStudiesScreen> createState() => _CaseStudiesScreenState();
}

class _CaseStudiesScreenState extends State<CaseStudiesScreen> {
  final ScrollController scrollController = ScrollController();

  List<ProjectsModel>? webProjects = List<ProjectsModel>.empty(growable: true);
  List<ProjectsModel>? mobileProjects =
      List<ProjectsModel>.empty(growable: true);
  List<ProjectsModel>? hybridProjects =
      List<ProjectsModel>.empty(growable: true);

  int selectedOption = 0;
  int webProjectsToShow = 5;
  int mobileProjectsToShow = 5;
  int hybridProjectsToShow = 1;

  void loadMoreWebProjects() {
    setState(() {
      webProjectsToShow += 3;
      if (webProjectsToShow > SelectedProjectData.selectedWebProjects.length) {
        webProjectsToShow = SelectedProjectData.selectedWebProjects.length;
      }
    });
  }

  void loadMoreMobileProjects() {
    setState(() {
      mobileProjectsToShow += 3;
      if (mobileProjectsToShow >
          SelectedProjectData.selectedMobileProjects.length) {
        mobileProjectsToShow =
            SelectedProjectData.selectedMobileProjects.length;
      }
    });
  }

  void loadMoreHybridProjects() {
    setState(() {
      hybridProjectsToShow += 3;
      if (hybridProjectsToShow >
          SelectedProjectData.selectedHybridProjects.length) {
        hybridProjectsToShow =
            SelectedProjectData.selectedHybridProjects.length;
      }
    });
  }

  @override
  void initState() {
    initialLaunch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
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
                      : isTabletScreen
                          ? EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .1,
                              vertical: 100)
                          : EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .04,
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
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 100)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .04,
                                vertical: 100),
                    child: Column(
                      children: [
                        SegmentedButtonSlide(
                          entries: [
                            SegmentedButtonSlideEntry(
                              icon: Ionicons.logo_web_component,
                              label: isMobileScreen ? 'Web' : "Web Apps",
                            ),
                            SegmentedButtonSlideEntry(
                              icon: Ionicons.phone_portrait,
                              label: isMobileScreen ? 'Mobile' : "Mobile Apps",
                            ),
                            SegmentedButtonSlideEntry(
                              icon: Ionicons.planet,
                              label: isMobileScreen ? 'Hybrid' : "Hybrid Apps",
                            ),
                          ],
                          selectedEntry: selectedOption,
                          onChange: (selected) =>
                              setState(() => selectedOption = selected),
                          colors: SegmentedButtonSlideColors(
                              barColor: Colors.grey.withOpacity(0.2),
                              backgroundSelectedColor: Colors.black87,
                              foregroundSelectedColor: Colors.white,
                              foregroundUnselectedColor: Colors.black,
                              hoverColor: Colors.grey.withOpacity(0.8)),
                          slideShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1)
                          ],
                          margin: EdgeInsets.symmetric(
                              horizontal: isDesktopScreen
                                  ? 100
                                  : isTabletScreen
                                      ? 40
                                      : 15),
                          height: isDesktopScreen
                              ? 60
                              : isTabletScreen
                                  ? 55
                                  : 50,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        selectedOption == 0
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: SelectedProjectData
                                                .selectedWebProjects.length <
                                            webProjectsToShow
                                        ? SelectedProjectData
                                            .selectedWebProjects.length
                                        : webProjectsToShow,
                                    itemBuilder: (context, index) {
                                      return DetailedShowcaseContainer(
                                        projectData: SelectedProjectData
                                            .selectedWebProjects[index],
                                      );
                                    },
                                  ),
                                  if (webProjectsToShow <
                                      SelectedProjectData
                                          .selectedWebProjects.length)
                                    InkWell(
                                      onTap: () => loadMoreWebProjects(),
                                      overlayColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 50),
                                        child: const Icon(
                                          Ionicons.arrow_down_circle_outline,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            : selectedOption == 1
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: SelectedProjectData
                                                    .selectedMobileProjects
                                                    .length <
                                                mobileProjectsToShow
                                            ? SelectedProjectData
                                                .selectedMobileProjects.length
                                            : mobileProjectsToShow,
                                        itemBuilder: (context, index) {
                                          return DetailedShowcaseContainer(
                                            projectData: SelectedProjectData
                                                .selectedMobileProjects[index],
                                            isMobileProjectShowcase: true,
                                          );
                                        },
                                      ),
                                      if (mobileProjectsToShow <
                                          SelectedProjectData
                                              .selectedMobileProjects.length)
                                        InkWell(
                                          onTap: () => loadMoreMobileProjects(),
                                          overlayColor: WidgetStateProperty.all(
                                            Colors.transparent,
                                          ),
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 50),
                                            child: const Icon(
                                              Ionicons
                                                  .arrow_down_circle_outline,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : FutureBuilder(
                                    future:
                                        ProjectsController.getHybridProjects(),
                                    builder: (context, snapshot) {
                                      hybridProjects = snapshot.data;
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasData) {
                                        return Text(
                                            "Hybrid Apps=> ${hybridProjects!.length.toString()}");
                                      } else {
                                        return const Center(
                                          child: Text(
                                              "Hybrid Apps to be showcased soon!"),
                                        );
                                      }
                                    },
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
