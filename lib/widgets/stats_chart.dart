import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';

class StatsChart extends StatefulWidget {
  final bool? showWorkButton;

  const StatsChart(
      {super.key, this.showWorkButton = true,});

  @override
  State<StatsChart> createState() => _StatsChartState();
}

class _StatsChartState extends State<StatsChart> {
  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    return Container(
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
                      vertical: 70),
      child: isDesktopScreen
          ? Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Experience with a variety\nof Projects and industries.",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Versatile experience across diverse projects and industries,\nbringing adaptability and valuable skills to any task.",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.contact);
                            },
                            child: Container(
                              margin: widget.showWorkButton == true
                                  ? const EdgeInsets.only(right: 20)
                                  : EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                "Talk with me",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          if (widget.showWorkButton == true)
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.caseStudies);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                ),
                                child: const Text(
                                  "See my work",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                                child: statIconBox(icon: CupertinoIcons.flame)),
                            Expanded(
                              child: statDetailBox(
                                  title: "50+", subtitle: "Projects\nfinished"),
                            ),
                            Expanded(
                                child: statIconBox(
                                    icon: CupertinoIcons.chart_pie_fill)),
                            Expanded(
                              child: statDetailBox(
                                  title: "35+",
                                  subtitle: "Websites\ndeveloped"),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: statDetailBox(
                                  title: "70+", subtitle: "Happy\nclients"),
                            ),
                            Expanded(
                                child:
                                    statIconBox(icon: CupertinoIcons.sparkles)),
                            Expanded(
                              child: statDetailBox(
                                  title: "4+", subtitle: "Years\nexperience"),
                            ),
                            Expanded(
                              child: statIconBox(
                                  icon: CupertinoIcons
                                      .arrow_up_arrow_down_circle_fill),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : isTabletScreen
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Experience with a variety of Projects and industries.",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Versatile experience across diverse projects and industries, bringing adaptability and valuable skills to any task.",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: widget.showWorkButton == true
                                    ? const EdgeInsets.only(right: 20)
                                    : EdgeInsets.zero,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text(
                                  "Talk with me",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            if (widget.showWorkButton == true)
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.caseStudies);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                  ),
                                  child: const Text(
                                    "See my work",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child:
                                      statIconBox(icon: CupertinoIcons.flame)),
                              Expanded(
                                child: statDetailBox(
                                    title: "50+",
                                    subtitle: "Projects\nfinished"),
                              ),
                              Expanded(
                                  child: statIconBox(
                                      icon: CupertinoIcons.chart_pie_fill)),
                              Expanded(
                                child: statDetailBox(
                                    title: "35+",
                                    subtitle: "Websites\ndeveloped"),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: statDetailBox(
                                      title: "70+",
                                      subtitle: "Happy\nclients")),
                              Expanded(
                                  child: statIconBox(
                                      icon: CupertinoIcons.sparkles)),
                              Expanded(
                                child: statDetailBox(
                                    title: "4+", subtitle: "Years\nexperience"),
                              ),
                              Expanded(
                                child: statIconBox(
                                    icon: CupertinoIcons
                                        .arrow_up_arrow_down_circle_fill),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Experience with a variety of Projects and industries.",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Versatile experience across diverse projects and industries, bringing adaptability and valuable skills to any task.",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: widget.showWorkButton == true
                                    ? const EdgeInsets.only(right: 20)
                                    : EdgeInsets.zero,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text(
                                  "Talk with me",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            if (widget.showWorkButton == true)
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.caseStudies);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                  ),
                                  child: const Text(
                                    "See my work",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child:
                                      statIconBox(icon: CupertinoIcons.flame)),
                              Expanded(
                                child: statDetailBox(
                                    title: "50+",
                                    subtitle: "Projects\nfinished"),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: statDetailBox(
                                    title: "35+",
                                    subtitle: "Websites\ndeveloped"),
                              ),
                              Expanded(
                                  child: statIconBox(
                                      icon: CupertinoIcons.chart_pie_fill)),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: statIconBox(
                                      icon: CupertinoIcons.sparkles)),
                              Expanded(
                                  child: statDetailBox(
                                      title: "70+",
                                      subtitle: "Happy\nclients")),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: statDetailBox(
                                    title: "4+", subtitle: "Years\nexperience"),
                              ),
                              Expanded(
                                child: statIconBox(
                                    icon: CupertinoIcons
                                        .arrow_up_arrow_down_circle_fill),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }

  Widget statDetailBox({required String title, required String subtitle}) {
    return Container(
      color: const Color(0xfff5f5f0).withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget statIconBox({required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Icon(
        icon,
        size: 40,
      ),
    );
  }
}
