import 'package:bookingapp/controller/core/core.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    super.key,
    required this.pageController,
    required this.count,
  });

  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: JumpingDotEffect(
          dotColor: kBlack,
          activeDotColor: kblue,
          dotHeight: 10,
          dotWidth: 10,
          spacing: 5,
          jumpScale: 3),
    );
  }
}
