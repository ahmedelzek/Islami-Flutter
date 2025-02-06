import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_flutter/ui/screens/home/taps/hadith/hadith_page.dart';

class HadithTap extends StatelessWidget {
  const HadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            enlargeFactor: 0.2),
        items: List.generate(50, (index) => index + 1).map((index) {
          return Builder(
            builder: (BuildContext context) {
              return HadithPage(index: index);
            },
          );
        }).toList());
  }
}
