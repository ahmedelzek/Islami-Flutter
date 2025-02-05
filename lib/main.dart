import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/home_screen.dart';
import 'package:islami_flutter/ui/screens/splash/splash_screen.dart';
import 'package:islami_flutter/ui/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami Flutter',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.gold),
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.gold,
          ),
          useMaterial3: true,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
              bodyLarge: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700))),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
