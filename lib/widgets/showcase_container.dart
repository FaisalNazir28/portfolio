import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';

class ShowcaseContainer extends StatefulWidget {
  final String title;
  final String description;
  final IconData initialIcon;
  final Color? firstContainerBG;
  final Color? secondContainerBG;
  final String firstContainerMainImage;
  final String firstContainerDetailImage;
  final Color? firstContainerMainImageBG;
  final Color? firstContainerDetailImageBG;
  final String secondContainerMainImage;
  final String secondContainerDetailImage;
  final Color? secondContainerMainImageBG;
  final Color? secondContainerDetailImageBG;
  final bool? hideTitles;

  const ShowcaseContainer({
    super.key,
    required this.title,
    required this.description,
    required this.initialIcon,
    this.firstContainerBG,
    this.secondContainerBG,
    this.firstContainerMainImageBG,
    this.firstContainerDetailImageBG,
    this.secondContainerMainImageBG,
    this.secondContainerDetailImageBG,
    required this.firstContainerMainImage,
    required this.firstContainerDetailImage,
    required this.secondContainerMainImage,
    required this.secondContainerDetailImage,
    this.hideTitles = false,
  });

  @override
  State<ShowcaseContainer> createState() => _ShowcaseContainerState();
}

class _ShowcaseContainerState extends State<ShowcaseContainer> {
  @override
  Widget build(BuildContext context) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        if (widget.hideTitles == false)
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    widget.initialIcon,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25.0),
                const Icon(CupertinoIcons.arrow_down_circle),
              ],
            ),
          ),
        if (widget.hideTitles == false) const SizedBox(height: 20.0),
        isMobileScreen
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: MediaQuery.of(context).size.height * .45,
                    decoration: BoxDecoration(
                      color: widget.firstContainerBG ?? Colors.grey.shade300,
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
                            color: widget.firstContainerMainImageBG ??
                                Colors.white,
                            child: Image.asset(
                              widget.firstContainerMainImage,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
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
                            color: widget.firstContainerDetailImageBG ??
                                Colors.white,
                            child: Image.asset(
                              widget.firstContainerDetailImage,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: MediaQuery.of(context).size.height * .45,
                    decoration: BoxDecoration(
                      color: widget.secondContainerBG ?? Colors.grey.shade300,
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
                            color: widget.secondContainerMainImageBG ??
                                Colors.white,
                            child: Image.asset(
                              widget.secondContainerMainImage,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
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
                            color: widget.secondContainerDetailImageBG ??
                                Colors.white,
                            child: Image.asset(
                              widget.secondContainerDetailImage,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: widget.firstContainerBG ?? Colors.grey.shade300,
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
                              color: widget.firstContainerMainImageBG ??
                                  Colors.white,
                              child: Image.asset(
                                widget.firstContainerMainImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
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
                              color: widget.firstContainerDetailImageBG ??
                                  Colors.white,
                              child: Image.asset(
                                widget.firstContainerDetailImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 25.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: widget.secondContainerBG ?? Colors.grey.shade300,
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
                              color: widget.secondContainerMainImageBG ??
                                  Colors.white,
                              child: Image.asset(
                                widget.secondContainerMainImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
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
                              color: widget.secondContainerDetailImageBG ??
                                  Colors.white,
                              child: Image.asset(
                                widget.secondContainerDetailImage,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
