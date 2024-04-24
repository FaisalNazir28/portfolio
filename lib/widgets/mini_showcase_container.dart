import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';

class MiniShowcaseContainer extends StatefulWidget {
  final String title;
  final String description;
  final Color? firstContainerBG;
  final String mainImage;
  final String detailImage;
  final Color? mainImageBG;
  final Color? detailImageBG;
  final bool initialContainer;

  const MiniShowcaseContainer({
    super.key,
    required this.title,
    required this.description,
    this.firstContainerBG,
    this.mainImageBG,
    this.detailImageBG,
    required this.mainImage,
    required this.detailImage,
    this.initialContainer = false,
  });

  @override
  State<MiniShowcaseContainer> createState() => _MiniShowcaseContainerState();
}

class _MiniShowcaseContainerState extends State<MiniShowcaseContainer> {
  @override
  Widget build(BuildContext context) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.initialContainer == false)
          const SizedBox(
            height: 60,
          ),
        Container(
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
                  color: widget.mainImageBG ?? Colors.white,
                  child: Image.asset(
                    widget.mainImage,
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
                  color: widget.detailImageBG ?? Colors.white,
                  child: Image.asset(
                    widget.detailImage,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          widget.title,
          style: isMobileScreen
              ? const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.5,
                )
              : const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.description,
          style: const TextStyle(fontSize: 16.0, color: Colors.black54),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: const Text(
                "View example work",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
