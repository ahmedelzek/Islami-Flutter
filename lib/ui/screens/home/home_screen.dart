import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../widgets/custom_scaffold_container.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldContainer(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Image.asset(AppAssets.islamiLogo)],
          ),
        ),
      ),
    );
  }
}
