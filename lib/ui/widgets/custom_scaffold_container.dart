import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class CustomScaffoldContainer extends StatelessWidget {
  String backgroundImage;
  Widget child;

  CustomScaffoldContainer(
      {super.key,
      this.backgroundImage = AppImages.homeBackground,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.fill)),
      child: child,
    );
  }
}
