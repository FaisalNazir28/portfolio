import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/controllers/projects_controller.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/services/stats_service.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';
import 'package:my_portfolio/widgets/mini_showcase_container.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:shimmer/shimmer.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final ScrollController scrollController = ScrollController();

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
                        "Transforming Visions into Reality",
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
                        "Explore our extensive portfolio for a glimpse into seamless digital solutions that elevate online experiences. I ensures your presence is not just noticed but remembered",
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
                            vertical: 120)
                        : isTabletScreen
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 120)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .04,
                                vertical: 60),
                    child: isMobileScreen
                        ? Column(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Let me assist you in achieving your goals",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Text(
                                    "I offer expertise in cross-platform development, problem-solving, and strategic planning for tailored solution that match your unique needs.",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FutureBuilder(
                                                future:
                                                    StatsService.getStatsData(),
                                                builder: (context, snapshot) {
                                                  var stats = snapshot.data;
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Shimmer.fromColors(
                                                      baseColor: Colors.black38,
                                                      highlightColor:
                                                          Colors.white30,
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.black38,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        width: 40,
                                                        height: 30,
                                                      ),
                                                    );
                                                  } else {
                                                    return Text(
                                                      "${stats!.projectsFinished}+",
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    );
                                                  }
                                                },
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                "Projects finished",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FutureBuilder(
                                                future:
                                                    StatsService.getStatsData(),
                                                builder: (context, snapshot) {
                                                  var stats = snapshot.data;
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Shimmer.fromColors(
                                                      baseColor: Colors.black38,
                                                      highlightColor:
                                                          Colors.white30,
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.black38,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        width: 40,
                                                        height: 30,
                                                      ),
                                                    );
                                                  } else {
                                                    return Text(
                                                      "${stats!.happyClients}+",
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    );
                                                  }
                                                },
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                "Happy clients",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              FutureBuilder(
                                  future: ProjectsController.getWebProjects(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator(
                                        color: Colors.black87,
                                      );
                                    } else {
                                      var portfolioWebsites = snapshot.data!
                                          .where((e) =>
                                              e.projectType ==
                                                  "Portfolio Development" ||
                                              e.projectType ==
                                                  "Portfolio Website")
                                          .toList();
                                      var fullPagerWebsites = snapshot.data!
                                          .where((e) =>
                                              e.projectType !=
                                                  "Portfolio Development" &&
                                              e.projectType !=
                                                  "Portfolio Website")
                                          .toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          MiniShowcaseContainer(
                                            title: 'Full pages Website design',
                                            description:
                                                'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                                            mainImage:
                                                fullPagerWebsites[1].mainImage,
                                            detailImage:
                                                fullPagerWebsites[1].mainImage,
                                            initialContainer: true,
                                          ),
                                          MiniShowcaseContainer(
                                            title: 'Portfolio Websites',
                                            description:
                                                'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                                            mainImage:
                                                portfolioWebsites[0].mainImage,
                                            detailImage: portfolioWebsites[0]
                                                .secondImage,
                                            detailImageBG: Colors.black,
                                          ),
                                        ],
                                      );
                                    }
                                  }),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isDesktopScreen
                                        ? const Text(
                                            "Let me assist you in\nachieving your goals",
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w600),
                                          )
                                        : const Text(
                                            "Let me assist you in achieving your goals",
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600),
                                          ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      isDesktopScreen
                                          ? "I offer expertise in cross-platform development, problem-solving,\nand strategic planning for tailored solution that match your\nunique needs."
                                          : "I offer expertise in cross-platform development, problem-solving, and strategic planning for tailored solution that match your unique needs.",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                  future: StatsService
                                                      .getStatsData(),
                                                  builder: (context, snapshot) {
                                                    var stats = snapshot.data;
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.black38,
                                                        highlightColor:
                                                            Colors.white30,
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color:
                                                                Colors.black38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      );
                                                    } else {
                                                      return Text(
                                                        "${stats!.projectsFinished}+",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      );
                                                    }
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Projects finished",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 100,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                  future: StatsService
                                                      .getStatsData(),
                                                  builder: (context, snapshot) {
                                                    var stats = snapshot.data;
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.black38,
                                                        highlightColor:
                                                            Colors.white30,
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color:
                                                                Colors.black38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      );
                                                    } else {
                                                      return Text(
                                                        "${stats!.happyClients}+",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      );
                                                    }
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Happy clients",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: isDesktopScreen ? 20 : 50,
                              ),
                              FutureBuilder(
                                  future: ProjectsController.getWebProjects(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .4,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      var portfolioWebsites = snapshot.data!
                                          .where((e) =>
                                              e.projectType ==
                                                  "Portfolio Development" ||
                                              e.projectType ==
                                                  "Portfolio Website")
                                          .toList();
                                      var fullPagerWebsites = snapshot.data!
                                          .where((e) =>
                                              e.projectType !=
                                                  "Portfolio Development" &&
                                              e.projectType !=
                                                  "Portfolio Website")
                                          .toList();
                                      return Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            MiniShowcaseContainer(
                                              title: 'Full Page Website Design',
                                              description:
                                                  'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                                              mainImage: fullPagerWebsites[0]
                                                  .mainImage,
                                              detailImage: fullPagerWebsites[0]
                                                  .mainImage,
                                              initialContainer: true,
                                            ),
                                            MiniShowcaseContainer(
                                              title: 'Portfolio Websites',
                                              description:
                                                  'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                                              mainImage: portfolioWebsites[0]
                                                  .mainImage,
                                              detailImage: portfolioWebsites[0]
                                                  .secondImage,
                                              mainImageBG: Colors.black,
                                              detailImageBG: Colors.black,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }),
                            ],
                          ),
                  ),
                ),
                const HorizontalScrollBarTile(),
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
