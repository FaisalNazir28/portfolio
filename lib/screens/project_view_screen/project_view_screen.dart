import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/selected_works_model.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';

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
                            ? MediaQuery.of(context).size.height * .25
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
                                // color: widget.firstImageBG ?? Colors.white,
                                color: Colors.white,
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
                                // color: widget.secondImageBG ?? Colors.white,
                                color: Colors.white,
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
                                // color: widget.thirdImageBG ?? Colors.white,
                                color: Colors.white,
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
                      const SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                projectModel.shortBio,
                                style: isDesktopScreen
                                    ? const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)
                                    : isTabletScreen
                                        ? const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)
                                        : const TextStyle(
                                            fontSize: 20,
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
                                    projectModel.title,
                                    style: isDesktopScreen
                                        ? const TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)
                                        : isTabletScreen
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
                                    style: isDesktopScreen
                                        ? const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)
                                        : isTabletScreen
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
                              ),
                            )
                          ],
                        ),
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
                        Row(
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
                          projectModel.description,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          height: isMobileScreen
                              ? MediaQuery.of(context).size.height * .25
                              : MediaQuery.of(context).size.height * .45,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRect(
                            child: OverflowBox(
                              child: Transform.translate(
                                offset: const Offset(280, -450),
                                child: Transform.rotate(
                                  alignment: Alignment.topLeft,
                                  angle: 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/art1.png'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/hmk1.png'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/hmk2.png'),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/art1.png'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/hmk1.png'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/hmk2.png'),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/art1.png'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/hmk1.png'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            roundCorneredImageView(
                                                imagePath:
                                                    'assets/showcase/hmk2.png'),
                                          ],
                                        ),
                                      ),
                                      // Expanded(
                                      //   flex: 3,
                                      //   child: Container(
                                      //     height: double.infinity,
                                      //     width: double.infinity,
                                      //     margin: const EdgeInsets.only(top: 30),
                                      //     // color: widget.firstImageBG ?? Colors.white,
                                      //     color: Colors.white,
                                      //     child: Image.asset(
                                      //       // widget.firstImage,
                                      //       'assets/showcase/art1.png',
                                      //       fit: BoxFit.fitWidth,
                                      //       alignment: Alignment.topCenter,
                                      //     ),
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 20,
                                      // ),
                                      // Expanded(
                                      //   flex: 3,
                                      //   child: Container(
                                      //     height: double.infinity,
                                      //     width: double.infinity,
                                      //     // color: widget.secondImageBG ?? Colors.white,
                                      //     color: Colors.white,
                                      //     child: Image.asset(
                                      //       // widget.secondImage,
                                      //       'assets/showcase/hmk1.png',
                                      //       fit: BoxFit.fitWidth,
                                      //       alignment: Alignment.center,
                                      //     ),
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 20,
                                      // ),
                                      // Expanded(
                                      //   flex: 2,
                                      //   child: Container(
                                      //     height: double.infinity,
                                      //     width: double.infinity,
                                      //     // color: widget.thirdImageBG ?? Colors.white,
                                      //     color: Colors.white,
                                      //     child: Image.asset(
                                      //       // widget.thirdImage,
                                      //       'assets/showcase/hmk2.png',
                                      //       fit: BoxFit.fitWidth,
                                      //       alignment: Alignment.center,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Challenge Faced:',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          projectModel.challengesFaced,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Results and Impact:',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          projectModel.results,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        devicePortfolioShowcase(),
                      ],
                    ),
                  ),
                ),
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

  Widget devicePortfolioShowcase() {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return isMobileScreen
        ? Column(
            children: [
              ClipRRect(
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
                      child: DeviceFrame(
                        device: Devices.ios.iPhone13ProMax,
                        screen: Image.asset(
                          'assets/showcase/art1.png',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 7,
                      child: DeviceFrame(
                        orientation: Orientation.landscape,
                        device: Devices.ios.iPad12InchesGen4,
                        screen: Image.asset(
                          'assets/showcase/art1.png',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft,
                        ),
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
                        child: DeviceFrame(
                          device: Devices.ios.iPhone13ProMax,
                          screen: Image.asset(
                            'assets/showcase/art1.png',
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 7,
                        child: DeviceFrame(
                          orientation: Orientation.landscape,
                          device: Devices.ios.iPad12InchesGen4,
                          screen: Image.asset(
                            'assets/showcase/art1.png',
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topLeft,
                          ),
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
    return Container(
      margin: EdgeInsets.only(top: hasInitialMargin == true ? 15 : 0),
      height: (MediaQuery.of(context).size.height * .4) / 2.5,
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
}
