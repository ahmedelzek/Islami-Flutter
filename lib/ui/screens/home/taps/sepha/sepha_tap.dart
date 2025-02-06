import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/utils/app_assets.dart';
import 'dart:math';

class SephaTap extends StatefulWidget {
  const SephaTap({super.key});

  @override
  State<SephaTap> createState() => _SephaTapState();
}

class _SephaTapState extends State<SephaTap> {
  int _count = 0;
  int _zikrIndex = 0;
  double _rotationAngle = 0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void _incrementCounter() {
    setState(() {
      if (_count < 32) {
        _count++;
      } else {
        _count = 0;
        _zikrIndex = (_zikrIndex + 1) % azkar.length; // Cycle through Azkar
      }
      _rotationAngle += pi / 16;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 50),
        GestureDetector(
          onTap: _incrementCounter,
          child: sepha(_count, azkar[_zikrIndex], _rotationAngle),
        ),
      ],
    );
  }
}

Widget sepha(int count, String zikr, double rotationAngle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Container(
        height: 75,
        width: 75,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.sephaHeader),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: rotationAngle, // Apply rotation
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.sephaBody),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                zikr,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "$count",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
