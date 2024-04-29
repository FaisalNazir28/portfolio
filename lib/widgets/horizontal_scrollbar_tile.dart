import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  statTileMobile(count: '15', text: 'Websites developed'),
                  statTileMobile(
                      count: '',
                      text: '',
                      icon: const Icon(
                        CupertinoIcons.textformat_abc_dottedunderline,
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
                        CupertinoIcons.airplane,
                        size: 40,
                      )),
                  statTileMobile(count: '33', text: 'Projects finished'),
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
                    statTile(count: '15', text: 'Websites developed'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          CupertinoIcons.textformat_abc_dottedunderline,
                          size: 40,
                        )),
                    statTile(count: '33', text: 'Projects finished'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          CupertinoIcons.airplane,
                          size: 40,
                        )),
                    statTile(count: '9', text: 'Apps Built'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Icons.code_off_sharp,
                          size: 40,
                        )),
                    statTile(count: '17', text: 'Recognitions'),
                    statTile(
                        count: '',
                        text: '',
                        icon: const Icon(
                          Icons.five_g_sharp,
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
