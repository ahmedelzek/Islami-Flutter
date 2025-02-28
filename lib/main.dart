import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/home_screen.dart';
import 'package:islami_flutter/ui/screens/onboarding/onboarding_screen.dart';
import 'package:islami_flutter/ui/screens/splash/splash_screen.dart';
import 'package:islami_flutter/ui/screens/surah/surah_details_screen.dart';
import 'package:islami_flutter/ui/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      theme: ThemeData(
          primaryColor: AppColors.gold,
          colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.gold, primary: AppColors.gold),
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.gold,
              selectedIconTheme: IconThemeData(color: Colors.white),
              selectedItemColor: Colors.black),
          useMaterial3: true,
          cardTheme: CardTheme(
            color: AppColors.gold,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyLarge: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              titleMedium: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColors.gold),
            titleTextStyle: TextStyle(
                color: AppColors.gold,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        SurahDetailsScreen.routeName: (_) => const SurahDetailsScreen(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
      },
    );
  }
}
