import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';
import 'package:my_portfolio/widgets/mini_showcase_container.dart';
import 'package:my_portfolio/widgets/review_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Scaffold(
      appBar: const CustomHeader(),
      endDrawer: isMobileScreen ? const CustomEndDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                            horizontal: MediaQuery.of(context).size.width * .1,
                            vertical: 120)
                        : EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .04,
                            vertical: 60),
                child: isMobileScreen
                    ? const Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let me assist you in achieving your goals",
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "I offer expertise in cross-platform development, problem-solving, and strategic planning for tailored solution that match your unique needs.",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
                              ),
                              SizedBox(
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
                                          Text(
                                            "50+",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Projects finished",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "80+",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
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
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MiniShowcaseContainer(
                                title: 'Full pages Website design',
                                description:
                                    'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                                mainImage: 'assets/showcase/art1.png',
                                detailImage: 'assets/showcase/art1.png',
                                initialContainer: true,
                              ),
                              MiniShowcaseContainer(
                                title: 'Portfolio Websites',
                                description:
                                    'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                                mainImage: 'assets/showcase/hmk1.png',
                                detailImage: 'assets/showcase/hmk2.png',
                                detailImageBG: Colors.black,
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
                                const IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "50+",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Projects finished",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "80+",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
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
                          const Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MiniShowcaseContainer(
                                  title: 'Full pages Website design',
                                  description:
                                      'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                                  mainImage: 'assets/showcase/art1.png',
                                  detailImage: 'assets/showcase/art1.png',
                                  initialContainer: true,
                                ),
                                MiniShowcaseContainer(
                                  title: 'Portfolio Websites',
                                  description:
                                      'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                                  mainImage: 'assets/showcase/hmk1.png',
                                  detailImage: 'assets/showcase/hmk2.png',
                                  detailImageBG: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const Row(
              children: [
                HorizontalScrollBarTile(
                    count: '15', text: 'Websites developed'),
                HorizontalScrollBarTile(
                    count: '',
                    text: '',
                    icon: Icon(
                      CupertinoIcons.textformat_abc_dottedunderline,
                      size: 40,
                    )),
                HorizontalScrollBarTile(count: '33', text: 'Projects finished'),
                HorizontalScrollBarTile(
                    count: '',
                    text: '',
                    icon: Icon(
                      CupertinoIcons.airplane,
                      size: 40,
                    )),
                HorizontalScrollBarTile(count: '9', text: 'Apps Built'),
                HorizontalScrollBarTile(
                    count: '',
                    text: '',
                    icon: Icon(
                      Icons.code_off_sharp,
                      size: 40,
                    )),
                HorizontalScrollBarTile(count: '17', text: 'Recognitions'),
                HorizontalScrollBarTile(
                    count: '',
                    text: '',
                    icon: Icon(
                      Icons.five_g_sharp,
                      size: 40,
                    )),
              ],
            ),
            ReviewWidget(defaultColor: false),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
