import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/selected_project_data.dart';
import 'package:my_portfolio/models/selected_works_model.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
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

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    final SelectedProjectModel projectModel =
        ModalRoute.of(context)!.settings.arguments as SelectedProjectModel;

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
                                color: projectModel.mainImageBG,
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
                                color: projectModel.secondImageBG,
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
                                color: projectModel.thirdImageBG,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      projectModel.shortBio,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          projectModel.title,
                                          style: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          projectModel.company,
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
                                  projectModel.shortBio,
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
                                  projectModel.title,
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
                                  projectModel.company,
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
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 100)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .04,
                                vertical: 100),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Project type",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Project date",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Project duration",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
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
                          projectModel.description,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        projectScreensContainer(),
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          'Challenge Faced:',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          projectModel.challengesFaced,
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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          projectModel.results,
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
                anotherWorkContainer(projectModel.index),
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

  Widget projectScreensContainer() {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    Widget roundCorneredImageView({required String imagePath}) {
      return Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
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
                                  imagePath: 'assets/showcase/art1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk2.png'),
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
                                  imagePath: 'assets/showcase/art1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk2.png'),
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
                                  imagePath: 'assets/showcase/art1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk1.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk2.png'),
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
                                  imagePath: 'assets/showcase/art1.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk1.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk2.png'),
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
                                  imagePath: 'assets/showcase/art1.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk1.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk2.png'),
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
                                  imagePath: 'assets/showcase/art1.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk1.png'),
                              const SizedBox(
                                height: 20,
                              ),
                              roundCorneredImageView(
                                  imagePath: 'assets/showcase/hmk2.png'),
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

  Widget devicePortfolioShowcase(SelectedProjectModel projectModel) {
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
                              imagePath: 'assets/showcase/art1.png',
                              imageAlignment: Alignment.topCenter,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            tabletView(
                              imagePath: 'assets/showcase/art1.png',
                              imageAlignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            tabletView(
                              imagePath: 'assets/showcase/art1.png',
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
                                imagePath: 'assets/showcase/art1.png',
                                imageAlignment: Alignment.topCenter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: 'assets/showcase/art1.png',
                                imageAlignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: 'assets/showcase/art1.png',
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
                                imagePath: 'assets/showcase/art1.png',
                                imageAlignment: Alignment.topCenter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: 'assets/showcase/art1.png',
                                imageAlignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              tabletView(
                                imagePath: 'assets/showcase/art1.png',
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
                            color: projectModel.mainImageBG,
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
                              color: projectModel.mainImageBG,
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
                            color: projectModel.mainImageBG,
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
                              color: projectModel.mainImageBG,
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
                                imagePath: 'assets/showcase/art1.png',
                                imageAlignment: Alignment.topCenter,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              tabletView(
                                imagePath: 'assets/showcase/art1.png',
                                imageAlignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              tabletView(
                                imagePath: 'assets/showcase/art1.png',
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
                                  imagePath: 'assets/showcase/art2.png',
                                  imageAlignment: Alignment.topCenter,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: 'assets/showcase/art2.png',
                                  imageAlignment: Alignment.center,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: 'assets/showcase/art2.png',
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
                                  imagePath: 'assets/showcase/art1.png',
                                  imageAlignment: Alignment.topCenter,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: 'assets/showcase/art1.png',
                                  imageAlignment: Alignment.center,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                tabletView(
                                  imagePath: 'assets/showcase/art1.png',
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
                              color: projectModel.mainImageBG,
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
                                color: projectModel.mainImageBG,
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
                              color: projectModel.mainImageBG,
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
                                color: projectModel.mainImageBG,
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
        screen: Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
          alignment: imageAlignment,
        ),
      ),
    );
  }

  Widget anotherWorkContainer(int currentIndex) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    List checkNextIndex() {
      List nextIndex = List.empty(growable: true);
      if (currentIndex == SelectedProjectData.selectedProjects.first.index) {
        nextIndex = [currentIndex + 1, currentIndex + 2];
      } else if (currentIndex ==
          SelectedProjectData.selectedProjects.last.index) {
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
                    vertical: 100)
                : EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .04,
                    vertical: 100),
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
                              .selectedProjects[checkNextIndex()[0]],
                          isProjectViewScreen: true,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: SelectedWorkContainer(
                          projectData: SelectedProjectData
                              .selectedProjects[checkNextIndex()[1]],
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
                            .selectedProjects[checkNextIndex()[0]],
                        isProjectViewScreen: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SelectedWorkContainer(
                        projectData: SelectedProjectData
                            .selectedProjects[checkNextIndex()[1]],
                        isProjectViewScreen: true,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
