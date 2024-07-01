import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/selected_works_model.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';

class DetailedShowcaseContainer extends StatefulWidget {
  final SelectedProjectModel projectData;
  final bool isMobileProjectShowcase;

  const DetailedShowcaseContainer({
    super.key,
    required this.projectData,
    this.isMobileProjectShowcase = false,
  });

  @override
  State<DetailedShowcaseContainer> createState() =>
      _DetailedShowcaseContainerState();
}

class _DetailedShowcaseContainerState extends State<DetailedShowcaseContainer> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return widget.isMobileProjectShowcase
        ? mobileShowcaseContainer()
        : webShowcaseContainer();
  }

  Widget mobileShowcaseContainer() {
    return Column(
      children: [
        if (widget.projectData.index != 0)
          const SizedBox(
            height: 120,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: DeviceFrame(
                device: Devices.ios.iPhone13ProMax,
                screen: Container(
                  color: widget.projectData.mainImageBG,
                  child: Image.asset(
                    widget.projectData.mainImage,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              flex: 2,
              child: DeviceFrame(
                device: Devices.ios.iPhone13ProMax,
                screen: Container(
                  color: widget.projectData.secondImageBG,
                  child: Image.asset(
                    widget.projectData.secondImage,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.projectData.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 45,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.projectData.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 17.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onHover: (v) {
                          setState(() {
                            hover = v;
                          });
                        },
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      hover ? Colors.black87 : Colors.black45,
                                  width: 2)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                CupertinoIcons.arrow_up_right,
                                color: hover ? Colors.black87 : Colors.black45,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Explore this project",
                                style: TextStyle(
                                    color:
                                        hover ? Colors.black87 : Colors.black45,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Client",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.projectData.company,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project date",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.projectData.projectDate,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project type",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.projectData.projectType,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Project duration",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.projectData.projectDuration,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget webShowcaseContainer() {
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.projectData.index != 0)
          const SizedBox(
            height: 100,
          ),
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
                  color: widget.projectData.mainImageBG,
                  child: Image.asset(
                    widget.projectData.mainImage,
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
                  color: widget.projectData.secondImageBG,
                  child: Image.asset(
                    widget.projectData.secondImage,
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
                  color: widget.projectData.thirdImageBG,
                  child: Image.asset(
                    widget.projectData.thirdImage,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        isMobileScreen
            ? Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.projectData.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.projectData.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17.0, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.project,
                              arguments: widget.projectData);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: const Text(
                            "View detail work",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Client",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.projectData.company,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
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
                                  widget.projectData.projectDate,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
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
                                  widget.projectData.projectType,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
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
                                  widget.projectData.projectDuration,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.projectData.title,
                          style: isTabletScreen
                              ? const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 45,
                                )
                              : const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 45,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.projectData.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 17.0, color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.project,
                                arguments: widget.projectData);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                            ),
                            child: const Text(
                              "View detail work",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Client",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.projectData.company,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
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
                              widget.projectData.projectDate,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
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
                              widget.projectData.projectType,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
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
                              widget.projectData.projectDuration,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
