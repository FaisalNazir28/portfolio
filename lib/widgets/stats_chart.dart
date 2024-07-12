import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/models/stats_model.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/services/firebase_collections.dart';
import 'package:my_portfolio/widgets/custom_app_button.dart';
import 'package:shimmer/shimmer.dart';

class StatsChart extends StatefulWidget {
  final bool? showWorkButton;

  const StatsChart({
    super.key,
    this.showWorkButton = true,
  });

  @override
  State<StatsChart> createState() => _StatsChartState();
}

class _StatsChartState extends State<StatsChart> {
  StatsModel statsModel = StatsModel();

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    return Container(
      margin: isDesktopScreen
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .2, vertical: 100)
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
                          CustomAppButton(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.contact),
                            text: 'Talk with me',
                            blackButton: true,
                            hasRightMargin: widget.showWorkButton!,
                            shrinkPadding: true,
                          ),
                          if (widget.showWorkButton == true)
                            CustomAppButton(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.caseStudies),
                              text: 'See my work',
                              shrinkPadding: true,
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
                            Expanded(child: statIconBox(icon: Ionicons.flower)),
                            Expanded(
                              child: FutureBuilder(
                                future: getAllStats(),
                                builder: (context, snapshot) {
                                  var stats = snapshot.data;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return statDetailBox(
                                        subtitle: "Projects\nfinished");
                                  } else {
                                    return statDetailBox(
                                        title: "${stats!.projectsFinished}+",
                                        subtitle: "Projects\nfinished");
                                  }
                                },
                              ),
                            ),
                            Expanded(child: statIconBox(icon: Ionicons.ribbon)),
                            Expanded(
                              child: FutureBuilder(
                                future: getAllStats(),
                                builder: (context, snapshot) {
                                  var stats = snapshot.data;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return statDetailBox(
                                        subtitle: "Websites\ndeveloped");
                                  } else {
                                    return statDetailBox(
                                        title: "${stats!.websitesDeveloped}+",
                                        subtitle: "Websites\ndeveloped");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: FutureBuilder(
                                future: getAllStats(),
                                builder: (context, snapshot) {
                                  var stats = snapshot.data;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return statDetailBox(
                                        subtitle: "Happy\nclients");
                                  } else {
                                    return statDetailBox(
                                        title: "${stats!.happyClients}+",
                                        subtitle: "Happy\nclients");
                                  }
                                },
                              ),
                            ),
                            Expanded(child: statIconBox(icon: Ionicons.apps)),
                            Expanded(
                              child: FutureBuilder(
                                future: getAllStats(),
                                builder: (context, snapshot) {
                                  var stats = snapshot.data;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return statDetailBox(
                                        subtitle: "Years\nexperience");
                                  } else {
                                    return statDetailBox(
                                        title: "${stats!.yearsExperience}+",
                                        subtitle: "Years\nexperience");
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: statIconBox(
                                  icon: Ionicons.logo_web_component),
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
                            CustomAppButton(
                              onTap: () =>
                                  Navigator.pushNamed(context, Routes.contact),
                              text: 'Talk with me',
                              blackButton: true,
                              hasRightMargin: widget.showWorkButton!,
                              shrinkPadding: true,
                            ),
                            if (widget.showWorkButton == true)
                              CustomAppButton(
                                onTap: () => Navigator.pushNamed(
                                    context, Routes.caseStudies),
                                text: 'See my work',
                                shrinkPadding: true,
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
                                  child: statIconBox(icon: Ionicons.flower)),
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Projects\nfinished");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.projectsFinished}+",
                                          subtitle: "Projects\nfinished");
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                  child: statIconBox(icon: Ionicons.ribbon)),
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Websites\ndeveloped");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.websitesDeveloped}+",
                                          subtitle: "Websites\ndeveloped");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Happy\nclients");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.happyClients}+",
                                          subtitle: "Happy\nclients");
                                    }
                                  },
                                ),
                              ),
                              Expanded(child: statIconBox(icon: Ionicons.apps)),
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Years\nexperience");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.yearsExperience}+",
                                          subtitle: "Years\nexperience");
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: statIconBox(
                                    icon: Ionicons.logo_web_component),
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
                            CustomAppButton(
                              onTap: () =>
                                  Navigator.pushNamed(context, Routes.contact),
                              text: 'Talk with me',
                              blackButton: true,
                              hasRightMargin: widget.showWorkButton!,
                              shrinkPadding: true,
                            ),
                            if (widget.showWorkButton == true)
                              CustomAppButton(
                                onTap: () => Navigator.pushNamed(
                                    context, Routes.caseStudies),
                                text: 'See my work',
                                shrinkPadding: true,
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
                              Expanded(child: statIconBox(icon: Ionicons.apps)),
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Projects\nfinished");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.projectsFinished}+",
                                          subtitle: "Projects\nfinished");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Websites\ndeveloped");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.websitesDeveloped}+",
                                          subtitle: "Websites\ndeveloped");
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                  child: statIconBox(
                                      icon: Ionicons.logo_web_component)),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: statIconBox(icon: Ionicons.flower)),
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Happy\nclients");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.happyClients}+",
                                          subtitle: "Happy\nclients");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: FutureBuilder(
                                  future: getAllStats(),
                                  builder: (context, snapshot) {
                                    var stats = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return statDetailBox(
                                          subtitle: "Years\nexperience");
                                    } else {
                                      return statDetailBox(
                                          title: "${stats!.yearsExperience}+",
                                          subtitle: "Years\nexperience");
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: statIconBox(icon: Ionicons.ribbon),
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

  Widget statDetailBox({String? title, required String subtitle}) {
    return Container(
      color: const Color(0xfff5f5f0).withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title != "" && title != null
              ? Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.black87,
                  highlightColor: Colors.white30,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    width: 40,
                    height: 22,
                  ),
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

  Future<StatsModel> getAllStats() async {
    StatsModel statsModel = StatsModel();
    DocumentSnapshot querySnapshot =
        await FbCollections.stats.doc('companyStats').get();

    if (querySnapshot.data() != null) {
      Map<String, dynamic> statData =
          querySnapshot.data() as Map<String, dynamic>;
      statsModel = StatsModel.fromJson(statData);
    }
    return statsModel;
  }
}
