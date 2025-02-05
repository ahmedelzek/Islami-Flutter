import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_flutter/ui/utils/app_colors.dart';

import '../../utils/app_assets.dart';

List<BottomNavigationBarItem> generateBottomNavItems(
    Map<String, String> iconMap) {
  return iconMap.entries
      .map((entry) => BottomNavigationBarItem(
          icon: SvgPicture.asset(entry.key),
          label: entry.value,
          backgroundColor: AppColors.gold))
      .toList();
}

Widget homeLogo() {
  return SizedBox(
    width: double.infinity, // Takes full width
    height: 200, // Adjust height as needed
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(top: 120, child: Image.asset(AppImages.islamiLogo)),
        Image.asset(AppImages.splashMosqueImg),
      ],
    ),
  );
}
