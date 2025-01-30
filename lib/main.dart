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
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
