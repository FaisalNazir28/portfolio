import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/models/projects_model.dart';
import 'package:my_portfolio/models/selected_project_data.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/widgets/custom_app_button.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/selected_work_container.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final ScrollController scrollController = ScrollController();
  final ScrollController horizontalScrollController = ScrollController();

  bool isLiked = false;
  bool isStarred = false;
  bool isLoved = false;

  @override
  void initState() {
    initialLaunch = false;
    super.initState();
  }

  @override
  void dispose() {
    horizontalScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    horizontalScrollController
        .jumpTo(horizontalScrollController.offset - details.primaryDelta!);
  }

  @override
  Widget build(BuildContext context) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final ProjectsModel projectModel = arguments["projectData"];
    final bool isMobileProject = arguments["isMobileProject"];

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
                isMobileProject
                    ? mobileAppShowcase(projectModel)
                    : webAppShowcase(projectModel, isMobileProject),
                ReviewWidget(defaultColor: true),
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

  Widget mobileAppShowcase(ProjectsModel projectModel) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Column(
      children: [
        Container(
          margin: isDesktopScreen
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2,
                  vertical: 100)
              : isTabletScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .1,
                      vertical: 80)
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .04,
                      vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectModel.projectName,
                          style: TextStyle(
                              fontSize: isDesktopScreen
                                  ? 60
                                  : isTabletScreen
                                      ? 45
                                      : 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          projectModel.clientCompany,
                          style: TextStyle(
                              fontSize: isDesktopScreen
                                  ? 18
                                  : isTabletScreen
                                      ? 17
                                      : 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: isMobileScreen ? 14 : 20,
                              vertical: isMobileScreen ? 8 : 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Built for",
                                style: TextStyle(
                                    fontSize: isMobileScreen ? 11 : 12,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (projectModel.builtForAndroid)
                                      Row(
                                        children: [
                                          Icon(
                                            Ionicons.logo_android,
                                            size: isMobileScreen ? 18 : 22,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Android",
                                            style: TextStyle(
                                                fontSize:
                                                    isMobileScreen ? 11 : 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    if (projectModel.builtForAndroid &&
                                        projectModel.builtForApple)
                                      SizedBox(
                                        width: isMobileScreen ? 6 : 10,
                                      ),
                                    if (projectModel.builtForAndroid &&
                                        projectModel.builtForApple)
                                      const VerticalDivider(
                                        thickness: 2,
                                      ),
                                    if (projectModel.builtForAndroid &&
                                        projectModel.builtForApple)
                                      SizedBox(
                                        width: isMobileScreen ? 6 : 10,
                                      ),
                                    if (projectModel.builtForApple)
                                      Row(
                                        children: [
                                          Icon(
                                            Ionicons.logo_apple,
                                            size: isMobileScreen ? 18 : 22,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Apple",
                                            style: TextStyle(
                                                fontSize:
                                                    isMobileScreen ? 11 : 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Ionicons.thumbs_up,
                              size: 20,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              projectModel.likesCount,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              CupertinoIcons.star_fill,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              projectModel.starsCount,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Ionicons.heart,
                              size: 20,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              projectModel.loveCount,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  projectModel.appIcon.isEmpty
                      ? Container(
                          height: isDesktopScreen
                              ? 250
                              : isTabletScreen
                                  ? 200
                                  : 130,
                          width: isDesktopScreen
                              ? 250
                              : isTabletScreen
                                  ? 200
                                  : 130,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.circular(isMobileScreen ? 25 : 50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 5),
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              projectModel.projectName[0],
                              style: TextStyle(
                                fontSize: isMobileScreen ? 70 : 100,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: isDesktopScreen
                              ? 250
                              : isTabletScreen
                                  ? 200
                                  : 130,
                          width: isDesktopScreen
                              ? 250
                              : isTabletScreen
                                  ? 200
                                  : 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(isMobileScreen ? 25 : 50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 5),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(isMobileScreen ? 25 : 50),
                            child: Center(
                              child: Padding(
                                padding: projectModel.iconPadding
                                    ? const EdgeInsets.all(20)
                                    : EdgeInsets.zero,
                                child: Image.asset(
                                  projectModel.appIcon,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              IntrinsicHeight(
                child: isMobileScreen
                    ? Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Project Date",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      projectModel.projectDate,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Project Type",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      projectModel.projectType,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Project Duration",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      projectModel.projectDuration,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isTabletScreen ? 16 : 20,
                                vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project Date",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  projectModel.projectDate,
                                  style: TextStyle(
                                    fontSize: isTabletScreen ? 16.5 : 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: isDesktopScreen ? 50 : 20,
                          ),
                          const VerticalDivider(
                            thickness: 1,
                          ),
                          SizedBox(
                            width: isDesktopScreen ? 50 : 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isTabletScreen ? 16 : 20,
                                vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project Type",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  projectModel.projectType,
                                  style: TextStyle(
                                    fontSize: isTabletScreen ? 16.5 : 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: isDesktopScreen ? 50 : 20,
                          ),
                          const VerticalDivider(
                            thickness: 1,
                          ),
                          SizedBox(
                            width: isDesktopScreen ? 50 : 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isTabletScreen ? 16 : 20,
                                vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project Duration",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  projectModel.projectDuration,
                                  style: TextStyle(
                                    fontSize: isTabletScreen ? 16.5 : 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      projectModel.projectShortBio,
                      style: isDesktopScreen
                          ? const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )
                          : isTabletScreen
                              ? const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )
                              : const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About this app",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    projectModel.projectDescription,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "App Preview",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: horizontalScrollController,
                    child: GestureDetector(
                      onHorizontalDragUpdate: _onHorizontalDragUpdate,
                      behavior: HitTestBehavior.translucent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (projectModel.mainImage.isNotEmpty)
                            mobileAppPreview(mainImage: projectModel.mainImage),
                          if (projectModel.secondImage.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.secondImage),
                          if (projectModel.thirdImage.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.thirdImage),
                          if (projectModel.extraImage1.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage1),
                          if (projectModel.extraImage2.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage2),
                          if (projectModel.extraImage3.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage3),
                          if (projectModel.extraImage4.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage4),
                          if (projectModel.extraImage5.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage5),
                          if (projectModel.extraImage6.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage6),
                          if (projectModel.extraImage7.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage7),
                          if (projectModel.extraImage8.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage8),
                          if (projectModel.extraImage9.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage9),
                          if (projectModel.extraImage10.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage10),
                          if (projectModel.extraImage11.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage11),
                          if (projectModel.extraImage12.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage12),
                          if (projectModel.extraImage13.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage13),
                          if (projectModel.extraImage14.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage14),
                          if (projectModel.extraImage15.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage15),
                          if (projectModel.extraImage16.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage16),
                          if (projectModel.extraImage17.isNotEmpty)
                            mobileAppPreview(
                                mainImage: projectModel.extraImage17),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Challenges Faced",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    projectModel.projectChallengesFaced,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Results and Impact",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    projectModel.projectResultsAndImpacts,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              likeTheWorkContainer(projectModel.projectName),
            ],
          ),
        ),
      ],
    );
  }

  Widget webAppShowcase(ProjectsModel projectModel, bool isMobileProject) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Column(
      children: [
        Container(
          margin: isDesktopScreen
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2,
                  vertical: 100)
              : isTabletScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .1,
                      vertical: 80)
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .04,
                      vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                height: isMobileScreen
                    ? MediaQuery.of(context).size.height * .30
                    : MediaQuery.of(context).size.height * .45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 30),
                        color: projectModel.darkMainImageBG
                            ? Colors.black
                            : Colors.white,
                        child: Image.asset(
                          projectModel.mainImage,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: projectModel.darkSecondImageBG
                            ? Colors.black
                            : Colors.white,
                        child: Image.asset(
                          projectModel.secondImage,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: projectModel.darkThirdImageBG
                            ? Colors.black
                            : Colors.white,
                        child: Image.asset(
                          projectModel.thirdImage,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isDesktopScreen ? 80 : 50,
              ),
              isDesktopScreen
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              projectModel.projectShortBio,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  projectModel.projectName,
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  projectModel.clientCompany,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectModel.projectShortBio,
                          style: isTabletScreen
                              ? const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)
                              : const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          projectModel.projectName,
                          style: isTabletScreen
                              ? const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)
                              : const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          projectModel.clientCompany,
                          style: isTabletScreen
                              ? const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)
                              : const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                      ],
                    )
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
                        vertical: 80)
                    : EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .04,
                        vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobileScreen
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Project type",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                projectModel.projectType,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Project date",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                projectModel.projectDate,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Project duration",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                projectModel.projectDuration,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project type",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  projectModel.projectType,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project date",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  projectModel.projectDate,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project duration",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  projectModel.projectDuration,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  projectModel.projectDescription,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                projectScreensContainer(projectModel: projectModel),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Challenge Faced:',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  projectModel.projectChallengesFaced,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Results and Impact:',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  projectModel.projectResultsAndImpacts,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                devicePortfolioShowcase(projectModel),
              ],
            ),
          ),
        ),
        anotherWorkContainer(
            int.parse(projectModel.projectIndex), isMobileProject),
      ],
    );
  }

  Widget projectScreensContainer({required ProjectsModel projectModel}) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    Widget roundCorneredImageView(
        {required String imagePath, required Color backgroundColor}) {
      return Container(
        height: 250,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
      );
    }

    return Container(
      height: isMobileScreen
          ? MediaQuery.of(context).size.height * .45
          : MediaQuery.of(context).size.height * .45,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: OverflowBox(
          child: Transform.translate(
            offset: isMobileScreen
                ? const Offset(280, -540)
                : const Offset(280, -450),
            child: Transform.rotate(
              alignment: Alignment.topLeft,
              angle: 0.5,
              child: isMobileScreen
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 180,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage1.isNotEmpty
                                    ? projectModel.extraImage1
                                    : projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage2.isNotEmpty
                                    ? projectModel.extraImage2
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 190,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 300,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage2.isNotEmpty
                                    ? projectModel.extraImage2
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage3.isNotEmpty
                                    ? projectModel.extraImage3
                                    : projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage4.isNotEmpty
                                    ? projectModel.extraImage4
                                    : projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 190,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage5.isNotEmpty
                                    ? projectModel.extraImage5
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage6.isNotEmpty
                                    ? projectModel.extraImage6
                                    : projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage1.isNotEmpty
                                    ? projectModel.extraImage1
                                    : projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage2.isNotEmpty
                                    ? projectModel.extraImage2
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage2.isNotEmpty
                                    ? projectModel.extraImage2
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage3.isNotEmpty
                                    ? projectModel.extraImage3
                                    : projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage4.isNotEmpty
                                    ? projectModel.extraImage4
                                    : projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage5.isNotEmpty
                                    ? projectModel.extraImage5
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.extraImage6.isNotEmpty
                                    ? projectModel.extraImage6
                                    : projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                imagePath: projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget devicePortfolioShowcase(ProjectsModel projectModel) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return isMobileScreen
        ? Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            tabletView(
                              hasInitialMargin: true,
                              imagePath: projectModel.mainImage,
                              backgroundColor: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              imageAlignment: Alignment.topCenter,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            tabletView(
                              imagePath: projectModel.secondImage,
                              backgroundColor: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              imageAlignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            tabletView(
                              imagePath: projectModel.thirdImage,
                              backgroundColor: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              imageAlignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: Transform.translate(
                          offset: const Offset(0, -65),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              tabletView(
                                imagePath: projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.topCenter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: projectModel.extraImage1.isNotEmpty
                                    ? projectModel.extraImage1
                                    : projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: projectModel.extraImage2.isNotEmpty
                                    ? projectModel.extraImage2
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.bottomCenter,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: Transform.translate(
                          offset: const Offset(0, -30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              tabletView(
                                imagePath: projectModel.extraImage3.isNotEmpty
                                    ? projectModel.extraImage3
                                    : projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.topCenter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: projectModel.extraImage4.isNotEmpty
                                    ? projectModel.extraImage4
                                    : projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: projectModel.extraImage5.isNotEmpty
                                    ? projectModel.extraImage5
                                    : projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.bottomCenter,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 7, right: 7),
                            color: projectModel.darkMainImageBG
                                ? Colors.black
                                : Colors.white,
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              projectModel.mainImage,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          DeviceFrame(
                            device: Devices.ios.iPhone13ProMax,
                            screen: Container(
                              color: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              child: Image.asset(
                                projectModel.mainImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 7,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 13, left: 13, right: 13),
                            color: projectModel.darkMainImageBG
                                ? Colors.black
                                : Colors.white,
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              projectModel.mainImage,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          DeviceFrame(
                            orientation: Orientation.landscape,
                            device: Devices.ios.iPad12InchesGen4,
                            screen: Container(
                              color: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              child: Image.asset(
                                projectModel.mainImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height * .4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              tabletView(
                                hasInitialMargin: true,
                                imagePath: projectModel.mainImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.topCenter,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              tabletView(
                                imagePath: projectModel.secondImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              tabletView(
                                imagePath: projectModel.thirdImage,
                                backgroundColor: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                imageAlignment: Alignment.bottomCenter,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 200,
                          child: Transform.translate(
                            offset: const Offset(0, -65),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                tabletView(
                                  imagePath: projectModel.thirdImage,
                                  backgroundColor: projectModel.darkMainImageBG
                                      ? Colors.black
                                      : Colors.white,
                                  imageAlignment: Alignment.topCenter,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: projectModel.extraImage1.isNotEmpty
                                      ? projectModel.extraImage1
                                      : projectModel.mainImage,
                                  backgroundColor: projectModel.darkMainImageBG
                                      ? Colors.black
                                      : Colors.white,
                                  imageAlignment: Alignment.center,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: projectModel.extraImage2.isNotEmpty
                                      ? projectModel.extraImage2
                                      : projectModel.secondImage,
                                  backgroundColor: projectModel.darkMainImageBG
                                      ? Colors.black
                                      : Colors.white,
                                  imageAlignment: Alignment.bottomCenter,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 200,
                          child: Transform.translate(
                            offset: const Offset(0, -30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                tabletView(
                                  imagePath: projectModel.extraImage3.isNotEmpty
                                      ? projectModel.extraImage3
                                      : projectModel.thirdImage,
                                  backgroundColor: projectModel.darkMainImageBG
                                      ? Colors.black
                                      : Colors.white,
                                  imageAlignment: Alignment.topCenter,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: projectModel.extraImage4.isNotEmpty
                                      ? projectModel.extraImage4
                                      : projectModel.mainImage,
                                  backgroundColor: projectModel.darkMainImageBG
                                      ? Colors.black
                                      : Colors.white,
                                  imageAlignment: Alignment.center,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: projectModel.extraImage5.isNotEmpty
                                      ? projectModel.extraImage5
                                      : projectModel.secondImage,
                                  backgroundColor: projectModel.darkMainImageBG
                                      ? Colors.black
                                      : Colors.white,
                                  imageAlignment: Alignment.bottomCenter,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 25.0),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 7, left: 7, right: 7),
                              color: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(
                                projectModel.mainImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            DeviceFrame(
                              device: Devices.ios.iPhone13ProMax,
                              screen: Container(
                                color: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                child: Image.asset(
                                  projectModel.mainImage,
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 7,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 13, left: 13, right: 13),
                              color: projectModel.darkMainImageBG
                                  ? Colors.black
                                  : Colors.white,
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(
                                projectModel.mainImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            DeviceFrame(
                              orientation: Orientation.landscape,
                              device: Devices.ios.iPad12InchesGen4,
                              screen: Container(
                                color: projectModel.darkMainImageBG
                                    ? Colors.black
                                    : Colors.white,
                                child: Image.asset(
                                  projectModel.mainImage,
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget tabletView({
    bool hasInitialMargin = false,
    required String imagePath,
    required Color backgroundColor,
    required Alignment imageAlignment,
    DeviceInfo? device,
  }) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Container(
      margin: EdgeInsets.only(top: hasInitialMargin == true ? 15 : 0),
      height: isMobileScreen
          ? 140
          : (MediaQuery.of(context).size.height * .4) / 2.5,
      child: DeviceFrame(
        orientation: Orientation.landscape,
        device: device ?? Devices.ios.iPad12InchesGen4,
        screen: Container(
          color: backgroundColor,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            alignment: imageAlignment,
          ),
        ),
      ),
    );
  }

  Widget anotherWorkContainer(int currentIndex, bool isMobileProject) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    List checkNextIndex() {
      List nextIndex = List.empty(growable: true);
      if (currentIndex == SelectedProjectData.selectedWebProjects.first.index) {
        nextIndex = [currentIndex + 1, currentIndex + 2];
      } else if (currentIndex ==
          SelectedProjectData.selectedWebProjects.last.index) {
        nextIndex = [currentIndex - 2, currentIndex - 1];
      } else {
        nextIndex = [currentIndex - 1, currentIndex + 1];
      }
      return nextIndex;
    }

    return Container(
      color: const Color(0xfff5f5f0),
      child: Container(
        margin: isDesktopScreen
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .2,
                vertical: 100)
            : isTabletScreen
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .1,
                    vertical: 80)
                : EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .04,
                    vertical: 60),
        child: Column(
          children: [
            const Text(
              "Another work",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 50,
            ),
            isDesktopScreen
                ? Row(
                    children: [
                      Expanded(
                        child: SelectedWorkContainer(
                          projectData: SelectedProjectData
                              .selectedWebProjects[checkNextIndex()[0]],
                          isMobileProject: isMobileProject,
                          isProjectViewScreen: true,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: SelectedWorkContainer(
                          projectData: SelectedProjectData
                              .selectedWebProjects[checkNextIndex()[1]],
                          isMobileProject: isMobileProject,
                          isProjectViewScreen: true,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SelectedWorkContainer(
                        projectData: SelectedProjectData
                            .selectedWebProjects[checkNextIndex()[0]],
                        isMobileProject: isMobileProject,
                        isProjectViewScreen: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SelectedWorkContainer(
                        projectData: SelectedProjectData
                            .selectedWebProjects[checkNextIndex()[1]],
                        isMobileProject: isMobileProject,
                        isProjectViewScreen: true,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget mobileAppPreview({required String mainImage}) {
    return Container(
      margin: const EdgeInsets.only(right: 80),
      height: MediaQuery.of(context).size.height * .45,
      child: DeviceFrame(
        device: Devices.ios.iPhone13ProMax,
        screen: Container(
          color: Colors.white,
          child: Image.asset(
            mainImage,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
      ),
    );
  }

  Widget likeTheWorkContainer(String title) {
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return IntrinsicHeight(
      child: isMobileScreen
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Like the work?",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Tooltip(
                      margin: const EdgeInsets.only(top: 1),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      message: "Like",
                      textStyle: const TextStyle(color: Colors.white),
                      child: InkWell(
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        onTap: isLiked == true
                            ? () {}
                            : () {
                                setState(() {
                                  isLiked = true;
                                });
                              },
                        child: Icon(
                          Ionicons.thumbs_up,
                          size: 28,
                          color: isLiked ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      margin: const EdgeInsets.only(top: 1),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(5)),
                      message: "Star",
                      textStyle: const TextStyle(color: Colors.white),
                      child: InkWell(
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        onTap: () {
                          setState(() {
                            isStarred = true;
                          });
                        },
                        child: Icon(
                          CupertinoIcons.star_fill,
                          size: 28,
                          color: isStarred ? Colors.yellow : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      margin: const EdgeInsets.only(top: 1),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      message: "Love",
                      textStyle: const TextStyle(color: Colors.white),
                      child: InkWell(
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        onTap: () {
                          setState(() {
                            isLoved = true;
                          });
                        },
                        child: Icon(
                          Ionicons.heart,
                          size: 28,
                          color: isLoved ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Reach out to me and discuss your app idea or simply leave me a appreciation string! ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Mention the application code provided below in your message if you need something like this application.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Application code: $title",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    CustomAppButton(
                      onTap: () => Navigator.pushNamed(context, Routes.contact),
                      text: 'Send message',
                      blackButton: true,
                      shrinkPadding: true,
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Like\nthe\nwork?",
                  style: TextStyle(
                      fontSize: isTabletScreen ? 70 : 100,
                      fontWeight:
                          isTabletScreen ? FontWeight.w600 : FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  width: isTabletScreen ? 45 : 80,
                ),
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: isTabletScreen ? 45 : 80,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: isTabletScreen ? 15 : 30,
                      ),
                      Row(
                        children: [
                          Tooltip(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            message: "Like",
                            textStyle: const TextStyle(color: Colors.white),
                            child: InkWell(
                              overlayColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              onTap: isLiked == true
                                  ? () {}
                                  : () {
                                      setState(() {
                                        isLiked = true;
                                      });
                                    },
                              child: Icon(
                                Ionicons.thumbs_up,
                                size: isTabletScreen ? 35 : 50,
                                color: isLiked ? Colors.blue : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Tooltip(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(5)),
                            message: "Star",
                            textStyle: const TextStyle(color: Colors.black),
                            child: InkWell(
                              overlayColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              onTap: () {
                                setState(() {
                                  isStarred = true;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.star_fill,
                                size: isTabletScreen ? 35 : 50,
                                color: isStarred ? Colors.yellow : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Tooltip(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            message: "Love",
                            textStyle: const TextStyle(color: Colors.white),
                            child: InkWell(
                              overlayColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              onTap: () {
                                setState(() {
                                  isLoved = true;
                                });
                              },
                              child: Icon(
                                Ionicons.heart,
                                size: isTabletScreen ? 35 : 50,
                                color: isLoved ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: isTabletScreen ? 35 : 50,
                      ),
                      Text(
                        "Reach out to me and discuss your app idea or simply leave me a appreciation string! ",
                        style: TextStyle(
                            fontSize: isTabletScreen ? 22 : 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: isTabletScreen ? 18 : 25,
                      ),
                      Text(
                        "Mention the application code provided below in your message if you need something like this application.",
                        style: TextStyle(
                            fontSize: isTabletScreen ? 14 : 18,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Application code: $title",
                        style: TextStyle(
                          fontSize: isTabletScreen ? 14 : 16,
                        ),
                      ),
                      SizedBox(
                        height: isTabletScreen ? 20 : 25,
                      ),
                      CustomAppButton(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.contact),
                        text: 'Send message',
                        blackButton: true,
                        shrinkPadding: isTabletScreen ? true : false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
