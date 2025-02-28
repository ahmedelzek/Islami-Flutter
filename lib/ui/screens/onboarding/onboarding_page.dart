import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(imagePath),
      Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Text(
        textAlign: TextAlign.center,
        description,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).primaryColor),
      )
    ]);
  }
}
