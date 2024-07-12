import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/services/stats_service.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalScrollBarTile extends StatefulWidget {
  const HorizontalScrollBarTile({
    super.key,
  });

  @override
  State<HorizontalScrollBarTile> createState() =>
      _HorizontalScrollBarTileState();
}

class _HorizontalScrollBarTileState extends State<HorizontalScrollBarTile> {
  @override
  Widget build(BuildContext context) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return isMobileScreen
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  FutureBuilder(
                    future: StatsService.getStatsData(),
                    builder: (context, snapshot) {
                      var stats = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return statTileMobile(text: 'Websites developed');
                      } else {
                        return statTileMobile(
                            count: stats!.websitesDeveloped,
                            text: 'Websites developed');
                      }
                    },
                  ),
                  statTileMobile(
                      count: '',
                      text: '',
                      icon: const Icon(
                        Ionicons.logo_web_component,
                        size: 40,
                      )),
                ],
              ),
              Row(
                children: [
                  statTileMobile(
                      count: '',
                      text: '',
                      icon: const Icon(
                        Ionicons.apps,
                        size: 40,
                      )),
                  FutureBuilder(
                    future: StatsService.getStatsData(),
                    builder: (context, snapshot) {
                      var stats = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return statTileMobile(text: 'Projects finished');
                      } else {
                        return statTileMobile(
                            count: stats!.projectsFinished,
                            text: 'Projects finished');
                      }
                    },
                  ),
                ],
              ),
            ],
          )
        : SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    FutureBuilder(
                      future: StatsService.getStatsData(),
                      builder: (context, snapshot) {
                        var stats = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return statTile(text: 'Websites developed');
                        } else {
                          return statTile(
                              count: stats!.websitesDeveloped,
                              text: 'Websites developed');
                        }
                      },
                    ),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.logo_web_component,
                          size: 40,
                        )),
                    FutureBuilder(
                      future: StatsService.getStatsData(),
                      builder: (context, snapshot) {
                        var stats = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return statTile(text: 'Projects finished');
                        } else {
                          return statTile(
                              count: stats!.projectsFinished,
                              text: 'Projects finished');
                        }
                      },
                    ),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.apps,
                          size: 40,
                        )),
                    FutureBuilder(
                      future: StatsService.getStatsData(),
                      builder: (context, snapshot) {
                        var stats = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return statTile(text: 'Apps Built');
                        } else {
                          return statTile(
                              count: stats!.applicationsBuilt,
                              text: 'Apps Built');
                        }
                      },
                    ),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.logo_apple_ar,
                          size: 40,
                        )),
                    FutureBuilder(
                      future: StatsService.getStatsData(),
                      builder: (context, snapshot) {
                        var stats = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return statTile(text: 'Recognitions');
                        } else {
                          return statTile(
                              count: stats!.recognitions, text: 'Recognitions');
                        }
                      },
                    ),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.ribbon,
                          size: 40,
                        )),
                  ],
                );
              },
            ),
          );
  }

  Widget statTile({
    Icon? icon,
    String? count,
    required String text,
  }) {
    return Container(
      height: 100,
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: icon ??
          Row(
            children: [
              count != "" && count != null
                  ? Text(
                      "$count+",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.black38,
                      highlightColor: Colors.white30,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: 40,
                        height: 30,
                      ),
                    ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ),
            ],
          ),
    );
  }

  Widget statTileMobile({
    Icon? icon,
    String? count,
    required String text,
  }) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: icon ??
            Row(
              children: [
                count != "" && count != null
                    ? Text(
                        "$count+",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )
                    : Shimmer.fromColors(
                        baseColor: Colors.black38,
                        highlightColor: Colors.white30,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 40,
                          height: 25,
                        ),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
