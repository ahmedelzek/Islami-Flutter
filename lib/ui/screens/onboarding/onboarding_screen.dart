import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/onboarding/onboarding_page.dart';
import 'package:islami_flutter/ui/utils/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/shared_preferences_utils.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Widget> _pages = [
    const OnboardingPage(
      title: OnBoardingTexts.onboardingTitle1,
      description: OnBoardingTexts.onboardingDescription1,
      imagePath: AppImages.onBoardingPage1,
    ),
    const OnboardingPage(
      title: OnBoardingTexts.onboardingTitle2,
      description: OnBoardingTexts.onboardingDescription2,
      imagePath: AppImages.onBoardingPage2,
    ),
    const OnboardingPage(
      title: OnBoardingTexts.onboardingTitle3,
      description: OnBoardingTexts.onboardingDescription3,
      imagePath: AppImages.onBoardingPage3,
    ),
    const OnboardingPage(
      title: OnBoardingTexts.onboardingTitle4,
      description: OnBoardingTexts.onboardingDescription4,
      imagePath: AppImages.onBoardingPage4,
    ),
    const OnboardingPage(
      title: OnBoardingTexts.onboardingTitle5,
      description: OnBoardingTexts.onboardingDescription5,
      imagePath: AppImages.onBoardingPage5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50,
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(AppImages.islamiLogo),
        Expanded(
            child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: _pages,
        )),
        _buildNavigationControls(),
      ],
    );
  }

  Widget _buildNavigationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Back Button
        TextButton(
          onPressed: _currentPage > 0
              ? () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : null,
          child: Text(
            "Back",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _currentPage > 0
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
          ),
        ),

        // Smooth Page Indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: _pages.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Theme.of(context).primaryColor,
          ),
        ),

        // Next/Finish Button
        TextButton(
          onPressed: () async {
            if (_currentPage < _pages.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              await setOnboardingCompleted(true);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          },
          child: Text(
            _currentPage == _pages.length - 1 ? "Finish" : "Next",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
