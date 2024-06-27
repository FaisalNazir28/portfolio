import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';

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
                  statTileMobile(count: '20', text: 'Websites developed'),
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
                  statTileMobile(count: '60', text: 'Projects finished'),
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
                    statTile(count: '20', text: 'Websites developed'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.logo_web_component,
                          size: 40,
                        )),
                    statTile(count: '60', text: 'Projects finished'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.apps,
                          size: 40,
                        )),
                    statTile(count: '50', text: 'Apps Built'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Ionicons.logo_apple_ar,
                          size: 40,
                        )),
                    statTile(count: '13', text: 'Recognitions'),
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
    required String count,
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
              Text(
                "$count+",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
    required String count,
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
                Text(
                  "$count+",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
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
