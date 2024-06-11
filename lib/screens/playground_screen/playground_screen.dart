import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/utilities/app_images.dart';
import 'package:my_portfolio/utilities/constants.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/showcase_container.dart';
import 'dart:html' as html;

class PlayGroundScreen extends StatefulWidget {
  const PlayGroundScreen({super.key});

  @override
  State<PlayGroundScreen> createState() => _PlayGroundScreenState();
}

class _PlayGroundScreenState extends State<PlayGroundScreen> {
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
                  child: isDesktopScreen
                      ? IntrinsicHeight(
                          child: Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Hello!",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Welcome to my playground",
                                      style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 35),
                                      child: const Text(
                                        "This is where i showcase the results of my projects and developments, will always be updated every month. "
                                        "You can also find my playground on other platforms such as:",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        externalButtons(
                                          link: AppConstants.github,
                                          icon: Ionicons.logo_github,
                                        ),
                                        externalButtons(
                                            icon: Ionicons.logo_bitbucket),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Hello!",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Welcome to my playground",
                                  style: isTabletScreen
                                      ? const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        )
                                      : const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "This is where i showcase the results of my projects and developments, will always be updated every month. "
                                  "You can also find my playground on other platforms such as:",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    externalButtons(
                                        link: AppConstants.github,
                                        icon: Ionicons.logo_github),
                                    externalButtons(
                                        icon: Ionicons.logo_bitbucket),
                                  ],
                                )
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
                            vertical: 120)
                        : EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .04,
                            vertical: isTabletScreen ? 80 : 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowcaseContainer(
                          title: 'Portfolio Websites',
                          description:
                              'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                          initialIcon: CupertinoIcons.desktopcomputer,
                          firstContainerMainImage: AppImages.hmk1,
                          firstContainerDetailImage: AppImages.hmk2,
                          secondContainerMainImage: AppImages.bridges1,
                          secondContainerDetailImage: AppImages.bridges4,
                          firstContainerMainImageBG: Colors.black,
                          firstContainerDetailImageBG: Colors.black,
                          secondContainerMainImageBG: Colors.black,
                          secondContainerDetailImageBG: Colors.black,
                          hideTitles: true,
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
                          hideTitles: true,
                        ),
                        ShowcaseContainer(
                          title: 'Portfolio Websites',
                          description:
                              'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                          initialIcon: CupertinoIcons.desktopcomputer,
                          firstContainerMainImage: AppImages.andres1,
                          firstContainerDetailImage: AppImages.andres2,
                          secondContainerMainImage: AppImages.hmk4,
                          secondContainerDetailImage: AppImages.andres4,
                          firstContainerMainImageBG: Colors.black,
                          firstContainerDetailImageBG: Colors.black,
                          secondContainerMainImageBG: Colors.black,
                          secondContainerDetailImageBG: Colors.black,
                          hideTitles: true,
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              openLinkInNewWindows(AppConstants.github);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Ionicons.logo_github,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "View more on Github",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const HorizontalScrollBarTile(),
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
}
