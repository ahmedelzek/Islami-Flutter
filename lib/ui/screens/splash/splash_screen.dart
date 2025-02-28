import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_assets.dart';
import '../../widgets/shared_preferences_utils.dart';
import '../home/home_screen.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final isOnboardingCompleted = await getOnboardingCompleted();
      // Navigate to the appropriate screen
      Navigator.pushReplacementNamed(
        context,
        isOnboardingCompleted
            ? HomeScreen.routeName
            : OnboardingScreen.routeName,
      );
    });
    return Scaffold(
      appBar: null,
      body: splashScreen(),
    );
  }

  Widget splashScreen() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.splashBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        const Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Image(image: AssetImage(AppImages.splashMosqueImg)),
        ),
        const Positioned(
            top: -3,
            right: 8,
            child: Image(image: AssetImage(AppImages.glowImg))),
        const Center(
          child: Image(image: AssetImage(AppImages.splashImg)),
        ),
        const Positioned(
            left: 0,
            top: 215,
            child: Image(image: AssetImage(AppImages.starsImg))),
        Positioned(
            right: 0,
            bottom: 130,
            child: Transform.flip(
                flipX: true,
                flipY: false,
                child: Image.asset(AppImages.starsImg))),
        Positioned(
            left: 0,
            right: 0,
            bottom: 25,
            child: Image.asset(AppImages.routeLogo)),
        const Positioned(
            left: 0,
            right: 0,
            bottom: 45,
            child: Text(
              textAlign: TextAlign.center,
              "Supervised by Ahmed Adel",
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ))
      ]),
    );
  }
}
