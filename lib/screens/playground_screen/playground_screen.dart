import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';
import 'package:my_portfolio/widgets/review_widget.dart';
import 'package:my_portfolio/widgets/showcase_container.dart';

class PlayGroundScreen extends StatefulWidget {
  const PlayGroundScreen({super.key});

  @override
  State<PlayGroundScreen> createState() => _PlayGroundScreenState();
}

class _PlayGroundScreenState extends State<PlayGroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 400, vertical: 100),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          "Welcome to my\nplayground",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "This is where i showcase the results of my projects and\ndevelopments, will always be updated every month. "
                          "You\ncan also find my playground on other platforms such as:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black38),
                              ),
                              child: const Icon(Icons.call_merge_sharp),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black38),
                              ),
                              child: const Icon(Icons.messenger_outline),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black38),
                              ),
                              child: const Icon(Icons.data_exploration_sharp),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black38),
                              ),
                              child: const Icon(Icons.deblur),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xfff5f5f0),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 400, vertical: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShowcaseContainer(
                      title: 'Portfolio Websites',
                      description:
                          'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                      initialIcon: CupertinoIcons.desktopcomputer,
                      firstContainerMainImage: 'assets/showcase/hmk1.png',
                      firstContainerDetailImage: 'assets/showcase/hmk2.png',
                      secondContainerMainImage: 'assets/showcase/bridges1.png',
                      secondContainerDetailImage:
                          'assets/showcase/bridges2.png',
                      firstContainerDetailImageBG: Colors.black,
                      secondContainerMainImageBG: Colors.black,
                      secondContainerDetailImageBG: Colors.black,
                      hideTitles: true,
                    ),
                    const ShowcaseContainer(
                      title: 'Full pages website design',
                      description:
                          'Creating immersive and engaging full-page website designs that captivate audiences and deliver a seamless user experience.',
                      initialIcon: Icons.desktop_windows_outlined,
                      firstContainerMainImage: 'assets/showcase/art1.png',
                      firstContainerDetailImage: 'assets/showcase/art1.png',
                      secondContainerMainImage: 'assets/showcase/barak1.png',
                      secondContainerDetailImage: 'assets/showcase/barak2.png',
                      hideTitles: true,
                    ),
                    const ShowcaseContainer(
                      title: 'Portfolio Websites',
                      description:
                          'Intuitively designed portfolio websites for esteemed users helping people showcase their work and skills.',
                      initialIcon: CupertinoIcons.desktopcomputer,
                      firstContainerMainImage: 'assets/showcase/hmk1.png',
                      firstContainerDetailImage: 'assets/showcase/hmk2.png',
                      secondContainerMainImage: 'assets/showcase/bridges1.png',
                      secondContainerDetailImage:
                          'assets/showcase/bridges2.png',
                      firstContainerDetailImageBG: Colors.black,
                      secondContainerMainImageBG: Colors.black,
                      secondContainerDetailImageBG: Colors.black,
                      hideTitles: true,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Center(
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
                              CupertinoIcons.square_stack_3d_down_dottedline,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "View more on Stack Overflow",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
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
            ReviewWidget(),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
