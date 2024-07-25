import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/utilities/app_images.dart';

class Review {
  final String username;
  final String designation;
  final String organization;
  final String reviewText;
  final String profileImagePath;

  Review(
    this.username,
    this.designation,
    this.organization,
    this.reviewText,
    this.profileImagePath,
  );
}

class ReviewWidget extends StatelessWidget {
  final bool defaultColor;
  final List<Review> reviews = [
    Review(
      'Umar Ayyaz Bheda',
      'Manager',
      'Gourmet Gulf',
      'We hired Faisal for Application Development, and the results were outstanding. His design sense and technical expertise are top-notch. Highly recommend his services!',
      AppImages.umarAyyaz,
    ),
    Review(
      'Sarah Martinez',
      'E-commerce Manager',
      'Global Trends Inc.',
      'Faisal truly understands the balance between aesthetics and functionality. Our new website not only looks fantastic but also performs seamlessly. Fantastic job!',
      AppImages.kenderJohn,
    ),
    Review(
      'John Johnson',
      'Marketing Director',
      'Stellar Brands',
      'Faisal is an exceptional website developer who transformed our online presence. His creativity and attention to detail exceeded our expectations. Stellar work!',
      AppImages.markLupher,
    ),
    Review(
      'Robert Fox',
      'Creative Director',
      'Visionary Ventures',
      'Faisal has an incredible knack for capturing brand essence through design. Our website now reflects our identity perfectly, thanks to his skillful work. Highly recommended!',
      AppImages.steveJon,
    ),
    Review(
      'Michael Chen',
      'Founder',
      'Innovate Labs',
      'Awesome work, keep it up!',
      AppImages.annaDel,
    ),
    // Add more reviews as needed
  ];

  ReviewWidget({super.key, this.defaultColor = true});

  @override
  Widget build(BuildContext context) {
    return ReviewCarousel(
      reviews: reviews,
      val: defaultColor,
    );
  }
}

class ReviewCarousel extends StatefulWidget {
  final List<Review> reviews;
  final bool? val;

  const ReviewCarousel({
    Key? key,
    required this.reviews,
    this.val = true,
  }) : super(key: key);

  @override
  ReviewCarouselState createState() => ReviewCarouselState();
}

class ReviewCarouselState extends State<ReviewCarousel> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.reviews.length;
      });
    });
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Container(
        color: widget.val == true ? const Color(0xfff5f5f0) : null,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: isDesktopScreen
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1,
                  vertical: 150,
                )
              : isTabletScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .02,
                      vertical: 100,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .005,
                      vertical: 80,
                    ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildReviewImagesCarousel(_currentIndex),
              SizedBox(
                height: isMobileScreen ? 30 : 50,
              ),
              ReviewDetails(review: widget.reviews[_currentIndex]),
            ],
          ),
        ));
  }

  Widget _buildReviewImagesCarousel(int index) {
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return isMobileScreen
        ? Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.reviews[index].profileImagePath,
                fit: BoxFit.cover,
              ),
            ),
          )
        : SizedBox(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.reviews.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onTap(index),
                  child: Container(
                    width: index == _currentIndex ? 120 : 60,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == _currentIndex
                            ? Colors.white
                            : Colors.transparent,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: index == _currentIndex
                          ? Image.asset(
                              widget.reviews[index].profileImagePath,
                              fit: BoxFit.cover,
                            )
                          : ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                  Colors.grey, BlendMode.saturation),
                              child: Image.asset(
                                widget.reviews[index].profileImagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class ReviewDetails extends StatelessWidget {
  final Review review;

  const ReviewDetails({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: isDesktopScreen
              ? const EdgeInsets.symmetric(horizontal: 200, vertical: 0)
              : isTabletScreen
                  ? const EdgeInsets.symmetric(horizontal: 100, vertical: 0)
                  : const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
          child: Text(
            "\"${review.reviewText}\"",
            textAlign: TextAlign.center,
            style: isMobileScreen
                ? const TextStyle(
                    fontSize: 22,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400)
                : const TextStyle(
                    fontSize: 28,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "${review.username}, ${review.designation}",
          style: isMobileScreen
              ? const TextStyle(fontSize: 19, fontWeight: FontWeight.w500)
              : const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Text(
          review.organization,
          style: const TextStyle(
              fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
