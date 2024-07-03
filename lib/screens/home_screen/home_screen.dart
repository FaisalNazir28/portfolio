import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/models/selected_project_data.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/utilities/app_images.dart';
import 'package:my_portfolio/widgets/custom_app_button.dart';
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
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      initialLaunch = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);
    var isMobileLessThan500 = Breakpoints.isMobileLessThan500(context);
    var isMobile500to550 = Breakpoints.isMobile500to550(context);
    var isTablet600to800 = Breakpoints.isTablet600to800(context);
    var isDesktop1200to1300 = Breakpoints.isDesktop1200to1300(context);
    var isDesktop1300to1400 = Breakpoints.isDesktop1300to1400(context);
    var isDesktop1400to1500 = Breakpoints.isDesktop1400to1500(context);
    var isDesktop1500to1600 = Breakpoints.isDesktop1500to1600(context);
    var isDesktop1600to1700 = Breakpoints.isDesktop1600to1700(context);
    var isDesktop1700to1800 = Breakpoints.isDesktop1700to1800(context);
    var isDesktop1800to1900 = Breakpoints.isDesktop1800to1900(context);

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Scaffold(
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
                              horizontal:
                                  MediaQuery.of(context).size.width * .2,
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            AssetImage(AppImages.faisal),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 17,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          CustomAppButton(
                                            onTap: () => Navigator.pushNamed(
                                                context, Routes.contact),
                                            text: 'Talk with me',
                                            blackButton: true,
                                            hasRightMargin: true,
                                          ),
                                          CustomAppButton(
                                            onTap: () => Navigator.pushNamed(
                                                context, Routes.caseStudies),
                                            text: 'See my work',
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
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppImages.faisal),
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
                                        CustomAppButton(
                                          onTap: () => Navigator.pushNamed(
                                              context, Routes.contact),
                                          text: 'Talk with me',
                                          blackButton: true,
                                          hasRightMargin: true,
                                        ),
                                        CustomAppButton(
                                          onTap: () => Navigator.pushNamed(
                                              context, Routes.caseStudies),
                                          text: 'See my work',
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
                                horizontal:
                                    MediaQuery.of(context).size.width * .2,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "Working experience",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        ExperienceTile(
                                            companyLogo:
                                                AppImages.soloinsightLogo,
                                            title:
                                                "SWE Flutter Applications at Soloinsight Inc",
                                            startDate: "March 2020",
                                            endDate: "Present"),
                                        ExperienceTile(
                                            companyLogo:
                                                AppImages.artAcheMagazineLogo,
                                            title:
                                                "Webmaster at Artache Magazine",
                                            startDate: "July 2023",
                                            endDate: "Present"),
                                        ExperienceTile(
                                            companyLogo: AppImages.fiverr,
                                            title:
                                                "Wordpress Developer at Fiverr",
                                            startDate: "October 2018",
                                            endDate: "Present"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          "Awards & Recognitions",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        ExperienceTile(
                                            companyLogo: AppImages.pieasLogo,
                                            title:
                                                "Best Website Design Award by PIEAS",
                                            startDate: "March 2022"),
                                        ExperienceTile(
                                            companyLogo:
                                                AppImages.soloinsightLogo,
                                            title:
                                                "Information Security Training by Soloinsight Inc",
                                            startDate: "January 2024"),
                                        ExperienceTile(
                                            companyLogo:
                                                AppImages.soloinsightLogo,
                                            title:
                                                "Application Security Training by Soloinsight Inc",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                      ExperienceTile(
                                          companyLogo:
                                              AppImages.soloinsightLogo,
                                          title:
                                              "SWE Flutter Applications at Soloinsight Inc",
                                          startDate: "March 2020",
                                          endDate: "Present"),
                                      ExperienceTile(
                                          companyLogo:
                                              AppImages.artAcheMagazineLogo,
                                          title:
                                              "Webmaster at Artache Magazine",
                                          startDate: "July 2023",
                                          endDate: "Present"),
                                      ExperienceTile(
                                          companyLogo: AppImages.fiverr,
                                          title:
                                              "Wordpress Developer at Fiverr",
                                          startDate: "October 2018",
                                          endDate: "Present"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                      ExperienceTile(
                                          companyLogo: AppImages.pieasLogo,
                                          title:
                                              "Best Website Design Award by PIEAS",
                                          startDate: "March 2022"),
                                      ExperienceTile(
                                          companyLogo:
                                              AppImages.soloinsightLogo,
                                          title:
                                              "Information Security Training by Soloinsight Inc",
                                          startDate: "January 2024"),
                                      ExperienceTile(
                                          companyLogo:
                                              AppImages.soloinsightLogo,
                                          title:
                                              "Application Security Training by Soloinsight Inc",
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
                                    left:
                                        MediaQuery.of(context).size.width * .1,
                                    right:
                                        MediaQuery.of(context).size.width * .1,
                                    bottom: 80)
                                : EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .04,
                                    right:
                                        MediaQuery.of(context).size.width * .04,
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
                                CustomAppButton(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.caseStudies),
                                  text: 'See my work',
                                  greyButton: true,
                                  shrinkPadding: true,
                                ),
                              ],
                            ),
                            ShowcaseContainer(
                              title: 'Portfolio Websites',
                              description:
                                  'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                              initialIcon: CupertinoIcons.desktopcomputer,
                              firstContainerMainImage: AppImages.hmk1,
                              firstContainerDetailImage: AppImages.hmk2,
                              secondContainerMainImage: AppImages.andres1,
                              secondContainerDetailImage: AppImages.andres3,
                              firstContainerMainImageBG: Colors.black,
                              firstContainerDetailImageBG: Colors.black,
                              secondContainerMainImageBG: Colors.black,
                              secondContainerDetailImageBG: Colors.black,
                            ),
                            ShowcaseContainer(
                              title: 'Full pages website design',
                              description:
                                  'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                              initialIcon: Icons.desktop_windows_outlined,
                              firstContainerMainImage: AppImages.artache1,
                              firstContainerDetailImage: AppImages.artache2,
                              secondContainerMainImage: AppImages.barak1,
                              secondContainerDetailImage: AppImages.barak2,
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
                                horizontal:
                                    MediaQuery.of(context).size.width * .2,
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
                                          : isMobileLessThan500
                                              ? 0.69
                                              : isMobile500to550
                                                  ? 0.76
                                                  : 0.83,
                                  crossAxisSpacing: 50.0,
                                  mainAxisSpacing: 50.0,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return SelectedWorkContainer(
                                    projectData: SelectedProjectData
                                        .selectedWebProjects[index],
                                    isMobileProject: false,
                                  );
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
        ),
        if (!isMobileScreen)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            top: initialLaunch == true
                ? 0
                : -(MediaQuery.of(context).size.height),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.faisal),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(500),
                        backgroundColor: Colors.white,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Building Engine",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
