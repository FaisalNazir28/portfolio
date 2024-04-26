import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/widgets/dateTime.dart';

class CustomFooter extends StatefulWidget {
  final bool? miniFooter;
  final bool? hideButton;

  const CustomFooter({
    super.key,
    this.miniFooter = false,
    this.hideButton = false,
  });

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    return Column(
      children: [
        if (widget.miniFooter == false)
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
              children: [
                Text(
                  "Have a project?",
                  style: isDesktopScreen
                      ? const TextStyle(fontSize: 22)
                      : isTabletScreen
                          ? const TextStyle(fontSize: 22)
                          : const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Let's talk with me",
                  style: isDesktopScreen
                      ? const TextStyle(
                          fontSize: 60, fontWeight: FontWeight.w600)
                      : isTabletScreen
                          ? const TextStyle(
                              fontSize: 55, fontWeight: FontWeight.w600)
                          : const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (widget.hideButton == false)
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.contact);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Talk with me",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                if (widget.hideButton == false)
                  const SizedBox(
                    height: 15,
                  ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My local time",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    DateTimeWidget(
                      timeOnly: true,
                    )
                  ],
                ),
              ],
            ),
          ),
        Container(
          margin: isDesktopScreen
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2,
                  vertical: 20)
              : isTabletScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .1,
                      vertical: 20)
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .04,
                      vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage:
                            AssetImage('assets/profiles/faisal.png'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Faisal Nazir",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Copyright © ${DateTime.now().year}",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/profiles/flutter.png',
                              scale: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "Made in Flutter",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ),
                  const Text(
                    "All rights reserved.",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
