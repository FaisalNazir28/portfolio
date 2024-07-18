import 'package:flutter/material.dart';
import 'package:my_portfolio/models/selected_works_model.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';

class SelectedWorkContainer extends StatefulWidget {
  final SelectedProjectModel projectData;
  final bool isProjectViewScreen;
  final bool isMobileProject;

  const SelectedWorkContainer({
    super.key,
    required this.projectData,
    required this.isMobileProject,
    this.isProjectViewScreen = false,
  });

  @override
  State<SelectedWorkContainer> createState() => _SelectedWorkContainerState();
}

class _SelectedWorkContainerState extends State<SelectedWorkContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isTablet600to800 = Breakpoints.isTablet600to800(context);

    return isDesktopScreen
        ? MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              // height: MediaQuery.of(context).size.height * .85,
              height: 650,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: isHovered ? 250.0 : 350.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              widget.projectData.mainImage,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Text(
                          widget.projectData.title,
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          widget.projectData.company,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          widget.projectData.projectDate,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 28.0),
                        Text(
                          widget.projectData.description,
                          maxLines: isHovered ? 4 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    bottom: isHovered ? 16.0 : -52.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.project,
                          arguments: {
                            "projectData": widget.projectData,
                            "isMobileProject": widget.isMobileProject,
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "View detail works",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : isTabletScreen
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            widget.isProjectViewScreen
                                ? Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        widget.projectData.mainImage,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          widget.projectData.mainImage,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: isTablet600to800 ? 25 : 50,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.projectData.title,
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              widget.projectData.company,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              widget.projectData.projectDate,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 28.0),
                            Expanded(
                              child: Text(
                                widget.projectData.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.project,
                                  arguments: {
                                    "projectData": widget.projectData,
                                    "isMobileProject": widget.isMobileProject,
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text(
                                  "View detail works",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.projectData.mainImage,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      widget.projectData.title,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      widget.projectData.company,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      widget.projectData.projectDate,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    widget.isProjectViewScreen == true
                        ? Text(
                            widget.projectData.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          )
                        : Expanded(
                            child: Text(
                              widget.projectData.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.project,
                              arguments: {
                                "projectData": widget.projectData,
                                "isMobileProject": widget.isMobileProject,
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              "View detail works",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }
}
